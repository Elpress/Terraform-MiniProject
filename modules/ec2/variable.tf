variable "maintainer" {
  type = string
  default = "elvis"
}

variable "instance_type" {
  type = string
  default = "t2.nano"
}

variable "ssh_key" {
  type = string
  default = "elpresskey"
}

variable "AZ" {
  type = string
  default = "us-east-1a"
}

variable "sg_name" {
  type = string
  default = "NULL"
}

variable "public_ip" {
  type = string
  default = "NULL"
}

variable "user" {
  type = string
  default = "ubuntu"
}