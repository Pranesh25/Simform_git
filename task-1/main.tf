provider "aws" {
    region =  "${var.region}"
    secret_key =  "${var.secret_key}"
    access_key =   "${var.access_key }"

}


resource "random_string" "random" {
  length = 5
  special = false
  upper = false
  
}


################################ CREATING VPC ##################################

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name =  join("-" ,[var.vpc_tag,random_string.random.result])    
  }

}


############################### CREATING PUBLIC SUBNET ###############################

resource "aws_subnet" "publicsubnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet1_cidr
  map_public_ip_on_launch = "true"

  tags = {
    Name = join("-" ,[var.public_subnet1_tag,random_string.random.result])    
  }
}

resource "aws_subnet" "publicsubnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet2_cidr
  map_public_ip_on_launch = "true"

  tags = {
    Name = join("-" ,[var.public_subnet2_tag,random_string.random.result])   
    
  }
}


################################ CREATING PRIVATE SUBNET ###############################



resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet1_cidr
  map_public_ip_on_launch = "false"

  tags = {
    Name = var.private_subnet1_tag
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet2_cidr
  map_public_ip_on_launch = "false"

  tags = {
    Name = var.private_subnet2_tag
  }
}



################################  CREATING INTERNET GATEWAY ###########################

resource "aws_internet_gateway" "publicGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "public Internet gateway"
  }
}


############################### CREATING PUBLIC ROUTE TABLE ####################################


resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.publicGW.id
  }

  tags = {
    Name = "public route"
  }
}



######################## ROUTE TABLE ASSOCIATION ######################################

resource "aws_route_table_association" "PublicRTassociation" {
    subnet_id = aws_subnet.publicsubnet1.id
    route_table_id = aws_route_table.publicRT.id
 }

 resource "aws_route_table_association" "PublicRTassociation2" {
    subnet_id = aws_subnet.publicsubnet2.id
    route_table_id = aws_route_table.publicRT.id
 }




 ##################### CREATING ROUTE TABLE PRIVATE ############################


 resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "private-route-table"
  }
}




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



############################### SECURITY GROUP FOR EC2 ###################################



resource "aws_security_group" "ec2SG" {
  name        = "ec2SG"
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
    description      = "HTTP"
    from_port        = var.http
    to_port          = var.http
    protocol         = "tcp"
    # cidr_blocks      = ["0.0.0.0/0"]
    # security_group_id  = [aws_security_group.lbsg.id]
    security_groups  = [aws_security_group.lbsg.id]
    # source_security_group_id = aws_security_group.sg0.id
    
  }

  ingress {
    description      = "SSH"
    from_port        = var.ssh
    to_port          = var.ssh
    protocol         = "tcp"
    cidr_blocks      = [var.myip]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "security for ec2"
  }
}




############################## Security rule group ################################

# resource "aws_security_group_rule" "example" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   # cidr_blocks       = [aws_vpc.example.cidr_block]
#   # ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   security_group_id =  [aws__security_group.lbsg.id]
# }

