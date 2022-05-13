

####################################################################################################
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



###################################################################################################

resource "aws_internet_gateway" "publicGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "public Internet gateway"
  }
}


###########################################################################################

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


#################################################################################################

resource "aws_route_table_association" "PublicRTassociation" {
    subnet_id = aws_subnet.publicsubnet1.id
    route_table_id = aws_route_table.publicRT.id
    
 }

 resource "aws_route_table_association" "PublicRTassociation2" {
    subnet_id = aws_subnet.publicsubnet2.id
    route_table_id = aws_route_table.publicRT.id
 }
