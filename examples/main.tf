provider "aws" {
  region = "${var.AWS_REGION}"
}

module "bastion_network" {
  source = "../bastion/network"

  bastion_cidr         = "10.0.0.0/16"
  bastion_private_cidr = "10.0.2.0/24"
  bastion_public_cidr  = "10.0.1.0/24"
  available_zone       = "${var.AWS_REGION}a"
}

# TODO: figure out key_name setup
resource "aws_instance" "vm" {
  ami                         = "ami-0ce0939b0e6ee49a6"
  instance_type               = "t2.micro"
  subnet_id                   = module.bastion_network.bastion_public_subnet_id
  vpc_security_group_ids      = [module.bastion_network.bastion_sg_id, module.bastion_network.bastion_private_sg_id]
  key_name                    = aws_key_pair.mongo_keypair.key_name


  tags = {
    Name = "BastionVM"
  }

  associate_public_ip_address = true
}


module "rs0" {
  tags = {
    Name = "mongodb-rs0-${count.index}"
  }
  replica_count = 3
  instance_type               = "t2.micro"
  ami                         = "ami-0a6c3dbb37451697f"

  source                      = "../"
  subnet_id                   = module.bastion_network.bastion_private_subnet_id
  vpc_security_group_ids      = [module.bastion_network.bastion_private_sg_id]
  bastion_host = aws_instance.vm.public_ip
  private_key     = file("~/.ssh/id_ed25519")
  public_key      = file("~/.ssh/id_ed25519.pub")
  key_name        = var.keypair_name
}

# TODO: add drive attaching for EBS data volumes
