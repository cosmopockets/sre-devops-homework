resource "aws_lb" "elb" {
    name                = "loadbalancer"
    load_balancer_type  = "application"
    subnets             = data.aws_subnet_ids.default.ids
}

# resource "aws_lb_listener" "http" {
#     load_balancer_arn   = aws_lb.elb.arn 
#     port                = 80
#     protocol            = "HTTP"
# }
data "aws_vpc" "default" {
    default = true
}

resource "aws_security_group" "alb" {
    name                = "traffic-control-lb"

    # Allow only inbound HTTP traffic
    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    egress {
        from_port      = 0
        to_port         = 0
        protocol        = -1
        cidr_blocks     = ["0.0.0.0/0"]
    }
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_lb" "sg_arg" {
    name                = "terraform-asg"
    load_balancer_type  = "application"
    # subnets             = data.aws_subnets_ids.defaults.ids
    security_groups      = [aws_security_group.alb.id]
}
resource "aws_lb_target_group" "asg"{
    name                = "terraform-asg"
    port                = 80
    protocol            = "HTTP"
    vpc_id              = "vpc-885188f2"

    health_check    {
        path            = "/"
        protocol        = "HTTP"
        matcher         = "200"
        interval        = 15
        timeout         = 3
        healthy_threshold = 2
        unhealthy_threshold = 2
    }
}
