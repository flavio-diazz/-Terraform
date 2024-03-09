variable "vpc_cidr_block" {
  type        = string
  description = "Cidr VPC"
}

variable "snet_cidr_block" {
  type        = string
  description = "Cidr Sub-Net"
}

variable "rtb_cidr_block" {
  type        = string
  description = "Cidr Route-Table"
}

variable "sec_group_name" {
  type        = string
  description = "Security Group Name"
}

variable "ingress_rule" {
  description = "Ingress Rule"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rule" {
  description = "Egress Rule"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

}

variable "tags" {
  type = map(any)
}
