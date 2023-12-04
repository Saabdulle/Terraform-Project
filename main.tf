module "Networking" {
    source = "./Modules/Networking"
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
