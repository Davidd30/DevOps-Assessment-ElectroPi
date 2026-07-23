variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "db_name" {
  type    = string
  default = "electropidb"
}

variable "db_username" {
  type    = string
  default = "dbadmin"
}

variable "ecs_security_group_id" {
  type = string
}