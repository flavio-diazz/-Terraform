# Aqui estamos definindo que as seguintes informaões serão exibidas na tela quado a criação for finalizada: ID da VPC, IP`s publicos e privados das instancias

# Network Outputs
output "VPC-ID" {
  value = module.network.vpc_id
}

# EC2 Outputs
output "Public-IP" {
  value = module.virtual-machine.inst_pulic_ip
}

output "Private-IP" {
  value = module.virtual-machine.inst_pulic_ip
}
