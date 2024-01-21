resource "aws_lb" "whisper_lb" {
  name                       = "whisper-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_sg.id]
  subnets                    = [aws_subnet.whisper_subnet_1.id, aws_subnet.whisper_subnet_2.id]
  idle_timeout               = 600 # 10 minutes for processing audio files
  enable_deletion_protection = false

  tags = {
    Name = "whisper-app-lb"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.whisper_lb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wshiper_lb_target_group.arn
  }
}

resource "aws_lb_target_group" "wshiper_lb_target_group" {
  name        = "whisper-lb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.whisper_vpc.id
  target_type = "ip"


  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 30
    path                = "/healthz"
    interval            = 60
    matcher             = "200"
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.whisper_vpc.id

  ingress {
    # from 80 -> 80 -> 8000
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



