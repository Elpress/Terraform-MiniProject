#Declaration des variables

variable "maintainer" {
  type = string
  default = "elvis"
}

variable "disk_size" {
  type = number
  default = 2
}

variable "AZ" {
  type = string
  default = "us-east-1"
}