resource "aws_instance" "ec2_instance" {
  for_each      = var.instance_config
  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = each.value.subnet_id
  key_name      = var.keypair

  tags = {
    Name = "${each.key}-instance"
  }
}

resource "aws_lb" "alb" {
  internal           = false
  load_balancer_type = "application"
  security_groups     = var.alb_sg_id
  subnets            = var.alb_subnets

  tags = {
    Name = "${var.name}-alb"
  }
}

resource "aws_lb_target_group" "alb_tg" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = {
    Name = "${var.name}-tg"
  }
}