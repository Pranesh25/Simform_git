public count = 2
private count = 2

[for i in range(2,100,2): cidrsubnet("192.168.0.0/24", 8 , i )] #for public
[for i in range(1,100,2): cidrsubnet("192.168.0.0/24", 8 , i )] #for private



data "aws_availability_zones" "available"{}
availability_zones = data.aws_availability_zones.available.names[count.index]
now edit above to this

availability_zones = random_shuffle.az_list.result[count.index]


resource "random_shuffle" "az_list"{
    input = data.aws_availability_zones.available.names
    result_count = var.max_count 
}

max count = 200 but go fo 20