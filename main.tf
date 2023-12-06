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
module "Lights" {
  source            = "./Modules/Lights-Server"
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.Security.security_group_id
  server_count      = var.server_count
  public_subnets    = module.Networking.public_subnets_ids
  count = length(var.server_names)
  server_names = var.server_names[count.index]
}
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
module "Load-Balancer" {
  source = "./Modules/Load-Balancer"
}
module "Auto-scaling" {
  source = "./Modules/Auto-Scaling"
}
module "DynamoDB" {
  source = "./Modules/DynamoDB"
  table_names = var.table_names
  table_tags = var.table_tags
}
