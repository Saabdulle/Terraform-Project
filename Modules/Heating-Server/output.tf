output "vpc_security_group_ids" {
    value = aws_instance.heating_app_server
}
output "public_server_ips" {
    value  = aws_instance.heating_app_server[*].public_ip
}