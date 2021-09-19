##########################
# NAGIOS SERVER INSTANCE #
##########################
resource "aws_instance" "nagios-server" {

  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.nagios-sg.id]
  monitoring             = true

  root_block_device {
      volume_type = var.volume_type
      volume_size = var.instance_size
  }
  
  tags = {
    Name        = "nagios-server"
    Terraform   = "true"
    Environment = var.env
  }
}
