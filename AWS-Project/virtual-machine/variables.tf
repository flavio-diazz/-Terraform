variable "ec2_ami" {
  description = "EC2 Instance AMI"
  type        = string
}

variable "inst_type" {
  description = "Instance Type"
  type        = string
}

variable "snet_id" {
  description = "Sub-Net ID"
  type        = string
}

variable "sec_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "block_vol_size" {
  description = "Volume Size"
  type        = string
}

variable "block_vol_type" {
  description = "Volume Type"
  type        = string
}
