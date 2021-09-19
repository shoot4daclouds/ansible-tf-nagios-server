##################
# AWS credential #
##################
variable "aws_profile" {
  type        = string
  description = "AWS cli credential profile to use."
}
variable "region" {
  type        = string
  description = "AWS region to use."
}
###############
# Environment #
###############
variable "env" {
  type        = string
  description = "The environment name."
}
###########################
# Nagios server variables #
###########################
variable "instance_ami" {
  type        = string
  description = "The ami name for the nagios server."
}
variable "instance_type" {
  type        = string
  description = "The instance type for the nagios server."
  default = "t2.micro"
}
variable "key_name" {
    type = string
    description = "Private Key for nagios server."
}
variable "volume_type" {
    type = string
    description = "Volume type for nagios server"
    default = "gp2"
}
variable "instance_size" {
  type        = number
  description = "The size of volume."
}
