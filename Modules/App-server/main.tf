resource "aws_instance" "lighting_app_server" {
  instance_type          = var.instance_type
  key_name               = var.key_name
  ami                    = "ami-0505148b3591e4c07"
  count                  = var.server_count
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.public_subnets[count.index]
  associate_public_ip_address = true
  tags = {
    Name = "Lighting App Server${count.index+1}"
  }
}
