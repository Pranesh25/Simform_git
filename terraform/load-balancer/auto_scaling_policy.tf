resource "aws_autoscaling_policy" "scalingPolicy" {
  name                   = "scaling-terraform-test"
  scaling_adjustment     = 3
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
}