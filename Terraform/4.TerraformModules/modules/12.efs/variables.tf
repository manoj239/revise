#This module should be created live during the class so that students can see how to create a module from scratch.

variable "efs_name" {
  description = "Name of the EFS"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}