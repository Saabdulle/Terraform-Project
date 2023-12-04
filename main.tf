module "Networking" {
    source = "./Modules/Networking"
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
    availability_zones = var.availability_zones
}
module "Security" {
    source = "./Modules/Security"
}
module "App-Server" {
    source = "./Modules/App-server"
}
module "Load-Balancer" {
    source = "./Modules/Load-Balancer"
}
module "Auto-scaling" {
    source = "./Modules/Auto-Scaling"
}
