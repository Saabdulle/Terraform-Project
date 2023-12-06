module "Networking" {
  source             = "./Modules/Networking"
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
  cidr_block         = var.cidr_block
}
module "Security" {
  source = "./Modules/Security"
  vpc_id = module.Networking.vpc_id
}
# module "Lights" {
#   source            = "./Modules/Lights-Server"
#   instance_type     = var.instance_type
#   key_name          = var.key_name
#   security_group_id = module.Security.security_group_id
#   server_count      = var.server_count
#   public_subnets    = module.Networking.public_subnets_ids
# }
# module "Heating" {
#   source            = "./Modules/Heating-Server"
#   instance_type     = var.instance_type
#   key_name          = var.key_name
#   security_group_id = module.Security.security_group_id
#   server_count      = var.server_count
#   public_subnets    = module.Networking.public_subnets_ids
# }
# module "Status" {
#   source = "./Modules/Status-Server"
#   instance_type     = var.instance_type
#   key_name          = var.key_name
#   security_group_id = module.Security.security_group_id
#   server_count      = var.server_count
#   public_subnets    = module.Networking.public_subnets_ids
# }
module "Apps-Server" {
  source            = "./Modules/Apps-Server"
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.Security.security_group_id
  server_count      = var.server_count
  public_subnets    = module.Networking.public_subnets_ids
}
module "Load-Balancer" {
  source = "./Modules/Load-Balancer"
  vpc_id = module.Networking.vpc_id
  security_group_ids = module.Security.security_group_id
  public_subnets = module.Networking.public_subnets_ids
  instance_ids = module.Apps-Server.instance_ids
}
module "Auto-scaling" {
  source = "./Modules/Auto-Scaling"
}
module "DynamoDB" {
  source = "./Modules/DynamoDB"
}
