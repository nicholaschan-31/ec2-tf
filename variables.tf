variable "name" {
  type        = string
  description = "for tag"
}

variable "instance_config" {
  type = map(object({
    ami           = string
    instance_type = string
    subnet_id     = string

  }))
  description = " for instance configuration"
}

variable "vpc_id" {
  type        = string
  description = "vpc_id"
}

variable "keypair" {
  type        = string
  description = "for keypair"
}

variable "alb_sg_id" {
  type        = list(string)
  description = "for alb sg"
}

variable "alb_subnets" {
  type        = list(string)
  description = "for alb subnets"
}

variable "iam_profile" {
  type = string
}

variable "ec2_sg_id" {
  type = list(string)
}