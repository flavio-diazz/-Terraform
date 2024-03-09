resource "aws_key_pair" "KEY-PAIR-01" {
  key_name   = "" #nome da chave de acesso
  public_key = file("") #path da pub key
}

resource "aws_instance" "INST-LNX-01" {
  count                       = 3 #numero de instancias que serão criadas
  ami                         = var.ec2_ami
  instance_type               = var.inst_type
  key_name                    = aws_key_pair.KEY-PAIR-01.key_name
  subnet_id                   = var.snet_id
  vpc_security_group_ids      = [var.sec_group_id]
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    volume_size           = var.block_vol_size
    volume_type           = var.block_vol_type
  }

  tags = {
    Name   = "SRV-LNX-${count.index + 1}" #aqui será adicionada a tag Name = SRV-LNX-numero da instancia partindo de 1
    Source = "TERRAFORM"
  }
}
