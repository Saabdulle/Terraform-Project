variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDR ranges"
}
variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR ranges"
}
variable "availability_zones" {
  type = list(string)
}

variable "cidr_block" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "server_count" {
  type = number
}
