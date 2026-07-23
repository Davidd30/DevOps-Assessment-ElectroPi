variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project" {
  type    = string
  default = "electro-pi"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "container_image" {
  type        = string
}

variable "container_port" {
  type    = number
  default = 5001
}