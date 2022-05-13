resource "aws_launch_configuration" "conf" {
  image_id      = "ami-0f9fc25dd2506cf6d"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}


# when Terraform must change a resource argument that cannot be updated in-place due to remote API limitations, Terraform will instead destroy the existing object and then create a new replacement object with the new configured arguments.