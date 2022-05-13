# -------------- ./networking/variables.tf 

variable "vpc_cidr" {
    type = string
    default = "192.168.0.0/24"
  
}


variable "vpc_tag" {
    type = string
    default = "pranesh-vpc"
  
}

