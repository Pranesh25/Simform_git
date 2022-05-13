
resource "aws_autoscaling_group" "asg" {
  name                      = "autoscaling-terraform-test"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = aws_launch_configuration.conf.id
  vpc_zone_identifier       = [aws_subnet.publicsubnet1.id, aws_subnet.publicsubnet2.id]

  target_group_arns =  [aws_lb_target_group.albTG.arn]

}