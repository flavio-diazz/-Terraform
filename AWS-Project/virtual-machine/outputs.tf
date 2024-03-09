output "inst_private_ip" {
  value = aws_instance.INST-LNX-01[*].private_ip
}

output "inst_pulic_ip" {
  value = aws_instance.INST-LNX-01[*].public_ip
}
