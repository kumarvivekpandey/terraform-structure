resource "aws_launch_template" "this" {
  name_prefix   = "${var.env_name}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.root_volume_size
      volume_type           = "gp3"
      delete_on_termination = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "${var.env_name}-instance"
      Environment = var.env_name
    }
  }
}

resource "aws_autoscaling_group" "this" {
  desired_capacity     = var.instance_count
  max_size             = var.instance_count
  min_size             = var.instance_count
  vpc_zone_identifier  = var.subnet_ids
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  
  health_check_type         = "EC2"
  health_check_grace_period = 300
  force_delete             = true
}
