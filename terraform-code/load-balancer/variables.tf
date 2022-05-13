variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}




####################################### variable for vpc ###########



variable "vpc_cidr" {
    type = string
    default = "192.168.0.0/24"
  
}


variable "vpc_tag" {
    type = string
    default = "pranesh-vpc"
  
}


############################# for public subnets ####################

variable "public_subnet1_cidr" {
    type = string
    default = "192.168.0.0/25"
  
}

variable "public_subnet1_tag" {
    type = string
    default = "pranesh-public-1"
  
}

############

variable "public_subnet2_cidr" {
    type = string
    default = "192.168.0.128/26"
  
}

variable "public_subnet2_tag" {
    type = string
    default = "pranesh-public-2"
  
}



############################# FOR PRIVATE SUBNETS ################################


variable "private_subnet1_cidr" {
    type = string
    default = "192.168.0.192/27"
  
}

variable "private_subnet1_tag" {
    type = string
    default = "pranesh-private-1"
  
}


################

variable "private_subnet2_cidr" {
    type = string
    default = "192.168.0.224/28"
  
}

variable "private_subnet2_tag" {
    type = string
    default = "pranesh-private-2"
  
}



########################################### SECURITY GROUP PORTS #######################


variable "http" {
    type = number
    default = 80
  
}

variable "https" {
    type = number
    default = 443
  
}

variable "ssh" {
    type = number
    default = 22
  
}

variable "myip" {
    type = string
    default = "103.156.103.211/32"
  
}



