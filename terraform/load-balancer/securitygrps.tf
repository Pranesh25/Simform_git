########################### CREATING SECURTITY GROUPS #####################################


 resource "aws_security_group" "lbsg" {
  name        = "loadbalancerSG"
  description = "Allow HTTP and HTTPS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "HTTPS"
    from_port        = var.https
    to_port          = var.https
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = var.ssh
    to_port          = var.ssh
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = var.http
    to_port          = var.http
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "security group loadbalancer"
  }
}


########################### CREATING SECURTITY GROUPS #####################################


 resource "aws_security_group" "ec2SG" {
  name        = "ec2-sg"
  description = "Allow all"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "allow all"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "security group loadbalancer"
  }
}
