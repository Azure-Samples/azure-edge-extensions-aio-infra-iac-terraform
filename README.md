# Azure Edge Extensions AIO IaC Terraform

Infrastructure as Code (IaC) Terraform to create sample infrastructure for an Azure IoT Operations (AIO) instance.

## Features

This project utilizes Terraform to do the following:

* (Optional) Provision an appropriately sized VM in Azure for Kubernetes and AIO.
* (Optional) Provision necessary service principals for onboarding Arc and Azure Key Vault Secrets Provider access in the cluster.
* (Optional) Outputs a script to be used on the machine that will have AIO.

## Getting Started

### Prerequisites

- (Optionally for Windows) [WSL](https://learn.microsoft.com/windows/wsl/install) installed and setup.
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) available on the command line where this will be deployed.
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) available on the command line where this will be deployed.
- (Optional) Owner access to a Subscription to deploy the infrastructure.

### Quickstart

1. Login to the AZ CLI:
    ```shell
    az login --tenant <tenant>.onmicrosoft.com
    ```
    - Make sure your subscription is the one that you would like to use: `az account show`.
    - Change to the subscription that you would like to use if needed:
      ```shell
      az account set -s <subscription-id>
      ```
1. Add a `<unique-name>.auto.tfvars` file to the root of the [deploy](deploy) directory that contains the following (refer to [deploy/sample.auto.tfvars.example](deploy/sample.auto.tfvars.example) for an example):
    ```hcl
    // <project-root>/deploy/<unique-name>.auto.tfvars

    name     = "sample-aio"
    location = "westus3"

    should_create_virtual_machine = "<true/false>"
    is_linux_server               = "<true/false>"
    should_use_event_hub          = "<true/false>"
    ```
1. From the [deploy](deploy) directory execute the following (the `<unique-name>.auto.tfvars` created earlier will automatically be applied):
   ```shell
   terraform init
   terraform apply
   ```

## Using Terraform Modules

It is possible to use the Terraform modules directly from this repository using the [module](https://developer.hashicorp.com/terraform/language/modules/syntax) primitive supported by HCL syntax.

An example of deploying just `infra` using Terraform from another repo would look like the following:

```hcl
module "aio_full" {
  source = "github.com/azure-samples/azure-edge-extensions-aio-iac-terraform//deploy/modules/infra"

  name     = var.name
  location = var.location

  should_create_virtual_machine = var.should_create_virtual_machine
  is_linux_server               = var.is_linux_server
}
```

If you would like to lock the module on a particular tag that's possible by adding a `?ref=<tag>` version to the end of the `source` field.

```hcl
module "aio_full_with_tag" {
  source = "github.com/azure-samples/azure-edge-extensions-aio-iac-terraform//deploy/modules/infra?ref=0.1.4"

  name     = var.name
  location = var.location

  should_create_virtual_machine = var.should_create_virtual_machine
  is_linux_server               = var.is_linux_server
}
```