# -------------- ./networking/main.tf

resource "random_string" "vpcRandom" {
    min = 2
    max = 50

}



resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true 
  enable_dns_support = true 
    tags = {
     Name =  join("-" ,[var.vpc_tag,random_string.vpcRandom.result])    
   
  }
  

}
