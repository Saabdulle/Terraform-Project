# resource "aws_lb_target_group" "lights_lb_tg" {
#   name             = "lights-tg"
#   port             = 3000
#   protocol         = "HTTP"
#   protocol_version = "HTTP1"
#   vpc_id           = var.vpc_id
#   target_type      = "instance"
#   health_check {
#     path = "/api/lights/health"
#     port = 3000
#     protocol = "HTTP"
#   }
# }


# resource "aws_lb_target_group_attachment" "app_lb_tg_attach" {
#   count            = length(var.instance_ids)
#   target_group_arn = aws_lb_target_group.lights_lb_tg.arn
#   target_id        = aws_instance.instance_ids[count.index]
# }
# resource "aws_lb" "app_lb" {
#   name               = "app-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [var.security_group_ids]
#   subnets            = var.public_subnets
#   tags = {
#     Environment = "production"
#   }
# }

# resource "aws_lb_listener" "app_lb_listener" {
#   load_balancer_arn = aws_lb.app_lb.arn
#   port = "80"
#   protocol = "HTTP"
#   default_action {
#     type = "forward"
#     target_group_arn = aws_lb_target_group.lights_lb_tg.arn
#   }
# }
