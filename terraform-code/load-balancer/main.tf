resource "random_string" "random" {
  length = 5
  special = false
  upper = false
  
}


################################ CREATING VPC ##################################

module "vpc" {
  source = "./modules"
  
}

############################### CREATING PUBLIC SUBNET ###############################

module "publicsubnet" {
  source = "./modules"
  
}

################################  CREATING INTERNET GATEWAY ###########################

module "igw" {
  source = "./modules"
  
}


############################### CREATING PUBLIC ROUTE TABLE ####################################

module "rtpublic" {
  source = "./modules"
  
}

######################## ROUTE TABLE ASSOCIATION ######################################

module "rtpublicAssociation" {
  source = "./modules"
  
}