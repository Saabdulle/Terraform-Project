output "vpc_security_group_ids" {
  value = aws_instance.home_apps_server
}
output "public_server_ips" {
  value = aws_instance.home_apps_server[*].public_ip
}
output "instance_ids" {
  value = aws_instance.home_apps_server[*].id
}

