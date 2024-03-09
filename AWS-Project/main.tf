terraform {

  # Declara as vesões que devem ser usadas nos providers
  required_version = ">=1.0.0"

  # Declara o provider da AWS e a versão que deve sera utilizada | Na configuração está definido que será utilizada especificamente a versão 5.35.0
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }

  # A utilziação do bloco de backend aponta para um S3 onde o state ficará armazenado, de forma remota nesse caso
  backend "s3" {
    bucket = "" #nome do bucket
    key    = "/terraform.tfstate" #path onde o tfstate será armazenado
    region = "" #região do bucket
  }

}

# No bloco providers é possível definir configurações e parametros que serão utilizados no provider
provider "aws" {
  region = "us-east-2"
}

# Bloco de network, onde serão passados os paramentros definidos nos arquivos de criação dos itens de network
module "network" {
  source          = "./network"
  vpc_cidr_block  = var.vpc_cidr_block
  snet_cidr_block = var.snet_cidr_block
  rtb_cidr_block  = var.rtb_cidr_block
  sec_group_name  = var.sec_group_name
  ingress_rule    = var.ingress_rule
  egress_rule     = var.egress_rule

  tags = var.tags
}

# Bloco de instancias, onde serão passados os paramentros definidos nos arquivos de criação das vms
module "virtual-machine" {
  source         = "./virtual-machine"
  ec2_ami        = var.ec2_ami
  inst_type      = var.inst_type
  snet_id        = module.network.snet_id #aqui precisamos referenciar o módulo de network, pois essas informações foram declaradas e serão consumidas nele
  sec_group_id   = module.network.security_group_id #aqui precisamos referenciar o módulo de network, pois essas informações foram declaradas e serão consumidas nele
  block_vol_size = var.block_vol_size
  block_vol_type = var.block_vol_type
}
