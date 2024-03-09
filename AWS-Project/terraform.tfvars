# Nesse projeto estou usando o arquivo .tfvars que é utilizado para gerenciar atribuições de variáveis de forma sistemática.
# Eles são especialmente úteis quando você trabalha com vários ambientes (como teste, staging e produção) e precisa configurar variáveis de acordo com cada ambiente.
# Arquivos nomeados como terraform.tfvars serão consultados por padrão no momento da execução, porém, caso seja nomeado com um nome diferente (filename.tfvars), é necessário declarar no momento da execução:
```bash 
terraform apply -var-file=my_vars.tfvars
```

# Network Variables
vpc_cidr_block  = "192.168.0.0/16"
snet_cidr_block = "192.168.1.0/24"
sec_group_name  = "sec-group-lnx-01"
rtb_cidr_block  = "0.0.0.0/0"

ingress_rule = [{    # como utilizei o tipo list(object) na varivel "ingress_rule", podemos repetir os itens utilizando a mesma variavel.
  from_port   = 0
  to_port     = 22
  protocol    = "SSH"
  cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 0
    to_port     = 443
    protocol    = "HTTPS"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rule = [{      # como utilizei o tipo list(object) na varivel "egress_rule", podemos repetir os itens utilizando a mesma variavel.
  from_port   = 0
  to_port     = 443
  protocol    = "HTTPS"
  cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 0
    to_port     = 80
    protocol    = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

tags = {
  Name   = "NETWORK"
  Source = "Terraform"
}

# EC2 Variables
ec2_ami        = "ami-05fb0b8c1424f266b"
inst_type      = "t2.micro"
block_vol_size = "30"
block_vol_type = "standard"
