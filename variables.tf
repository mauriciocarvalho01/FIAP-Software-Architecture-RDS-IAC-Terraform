variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "db_name" {
  default = "restauranteacme"
}

variable "db_username" {
  default = "developer0101"
}

variable "db_password" {
  default = "developer0101"
  sensitive = true
}

variable "db_instance_class" {
  default = "db.t3.micro"
}

variable "allocated_storage" {
  default = 20
}