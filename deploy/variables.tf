variable "name" {
  description = "The unique primary name used when naming resources. (ex. 'test' makes 'rg-test' resource group)"
  type        = string
  nullable    = false
  validation {
    condition     = var.name != "sample-aio" && length(var.name) < 15 && can(regex("^[a-z0-9][a-z0-9-]{1,60}[a-z0-9]$", var.name))
    error_message = "Please update 'name' to a short, unique name, that only has lowercase letters, numbers, '-' hyphens."
  }
}

variable "location" {
  type    = string
  default = "eastus2"
}

variable "should_create_aio_onboard_sp" {
  description = "Creates a new Service Principal with 'Kubernetes Cluster - Azure Arc Onboarding' and 'Kubernetes Extension Contributor' roles for onboarding the new cluster to Arc."
  type        = bool
  default     = true
}

variable "should_create_aio_sp" {
  description = "Creates a new Service Principal with 'Get' and 'List' permissions on Azure Key Vault for AIO to use in the cluster."
  type        = bool
  default     = true
}

variable "aio_sp_onboard_client_id" {
  description = "(Optional) The Service Principal Client ID for onboarding the cluster to Arc. (Otherwise, creates new one)"
  type        = string
  default     = null
  nullable    = true
}

variable "aio_sp_onboard_client_secret" {
  description = "(Optional) The Service Principal Client Secret for onboarding the cluster to Arc. (Otherwise, creates new one)"
  type        = string
  default     = null
  sensitive   = true
  nullable    = true
}

variable "aio_sp_client_id" {
  description = "(Optional) The Service Principal Client ID for AIO to use with Azure Key Vault. (Otherwise, creates new one)"
  type        = string
  default     = null
  nullable    = true
}

variable "aio_sp_client_secret" {
  description = "(Optional) The Service Principal Client Secret for AIO to use with Azure Key Vault. (Otherwise, creates new one)"
  type        = string
  default     = null
  sensitive   = true
  nullable    = true
}

variable "should_create_virtual_machine" {
  description = "(Optional) Create a virtual machine"
  type        = bool
  default     = false
}

variable "is_linux_server" {
  description = "The OS of the server."
  type        = bool
}

variable "should_create_storage_account" {
  description = "Creates a new Storage Account"
  type        = bool
  default     = false
}

variable "should_create_container_registry" {
  description = "Creates a new Container Registry"
  type        = bool
  default     = false
}

variable "should_use_event_hub" {
  description = "(Optional) Use Event Hub for AIO to send data to cloud"
  type        = bool
  default     = false
}

variable "should_use_event_grid" {
  description = "(Optional) Use Event Grid for AIO to send data to cloud"
  type        = bool
  default     = false
}

variable "vm_size" {
  description = "(Optional) The size of the VM that will be deployed."
  type        = string
  default     = "Standard_D4_v4"
}

variable "vm_storage_account_type" {
  description = "(Optional) The OS Disk Storage Account Type."
  type        = string
  default     = "Standard_LRS"
}

variable "resource_group_name" {
  description = "(Optional) The resource group name where the Azure Arc Cluster resource is located. (Otherwise, 'rg-<var.name>', only used when skipping infra install)"
  type        = string
  default     = null
}

variable "key_vault_name" {
  description = "(Optional) the Azure Key Vault resource name. (Otherwise, 'kv-<var.name>', only used when skipping infra install)"
  type        = string
  default     = null
}