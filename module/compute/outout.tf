output "instance_ids" {
  description = "IDs of ASG instances"
  value       = aws_autoscaling_group.this.instances
}

output "asg_name" {
  description = "Autoscaling group name"
  value       = aws_autoscaling_group.this.name
}
