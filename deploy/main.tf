module "infra" {
  source = "./modules/infra"

  name     = var.name
  location = var.location

  should_create_aio_onboard_sp = var.should_create_aio_onboard_sp
  aio_sp_onboard_client_id     = var.aio_sp_onboard_client_id
  aio_sp_onboard_client_secret = var.aio_sp_onboard_client_secret
  should_create_aio_sp         = var.should_create_aio_sp
  aio_sp_client_id             = var.aio_sp_client_id
  aio_sp_client_secret         = var.aio_sp_client_secret

  should_create_storage_account    = var.should_create_storage_account
  should_create_container_registry = var.should_create_container_registry

  should_create_virtual_machine = var.should_create_virtual_machine
  is_linux_server               = var.is_linux_server
  vm_size                       = var.vm_size

  should_use_event_hub  = var.should_use_event_hub
  should_use_event_grid = var.should_use_event_grid
}
