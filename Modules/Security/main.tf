data "http" "myipaddr" {
   url = "http://icanhazip.com"
}
resource "aws_security_group" "allow_http" {
  name        = "TF-Project allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_http.id
}


resource "aws_security_group" "allow_https" {
  name        = "TF_Project allow_https"
  description = "Allow https inbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_https" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_https.id
}

resource "aws_security_group" "allow_egress" {
  name        = "TF-Project allow_egress"
  description = "Allow egress inbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_egress.id
}
# SSH security group
resource "aws_security_group" "allow_ssh" {
  name = "TF_Project allow_ssh"
  description = "Allow SSH for inbound traffic"
  vpc_id = var.vpc_id
}
# SSH rule for HTTP security group
resource "aws_security_group_rule" "allow_http_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["YOUR_IP_ADDRESS/32"]
  security_group_id = aws_security_group.allow_ssh.id
}

# SSH rule for HTTPS security group
resource "aws_security_group_rule" "allow_https_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["YOUR_IP_ADDRESS/32"]
  security_group_id = aws_security_group.allow_https.id
}
resource "aws_security_group_rule" "allow_app_server" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_http.id
}
