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

module "Apps-Server" {
  source            = "./Modules/Apps-Server"
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.Security.security_group_id
  server_count      = var.server_count
  public_subnets    = module.Networking.public_subnets_ids
}
module "Load-Balancer" {
  source             = "./Modules/Load-Balancer"
  vpc_id             = module.Networking.vpc_id
  security_group_ids = module.Security.security_group_id
  public_subnets     = module.Networking.public_subnets_ids
  instance_ids       = module.Apps-Server.instance_ids
  # ami_images = var.ami_images
}
module "Auto-scaling" {
  source             = "./Modules/Auto-Scaling"
  instance_type      = var.instance_type
  public_subnets     = module.Networking.public_subnets_ids
  key_name           = var.key_name
  server_names       = var.server_names
  instance_ids       = module.Apps-Server.instance_ids
  security_group_ids = module.Security.security_group_id
  min_size           = var.min_size
  max_size           = var.max_size
  desired_size       = var.desired_size
  target_group_ids   = module.Load-Balancer.target_group_ids
  ami_images         = var.ami_images
}
module "DynamoDB" {
  source      = "./Modules/DynamoDB"
  table_tags  = var.table_tags
  table_names = var.table_names
}
