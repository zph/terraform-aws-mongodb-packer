variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = ""
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "platform" {
  description = "A base image for EC2 mongo instance"
  type        = string
  default     = "ubuntu-18.04"
}

variable "mongodb_version" {
  description = "Mongo version for base image"
  type        = string
  default     = "4.2"
}

variable "ami_version" {
  description = "version of ami image"
  type        = string
  default     = "1.0"
}

variable "bastion_host" {
  description = "Bastion host"
  type        = string
}

variable "private_key" {
  description = "Private key"
}

variable "ssh_user" {
  description = "ssh user"
  default     = "ubuntu"
}

variable "replica_count" {
  description = "Number of nodes for replica set"
  default     = 3
}

variable "db_admin_user" {
  default     = "admin"
  description = "An adminstrative user for managing mongo dbs"
}

variable "db_admin_pwd" {
  default     = "admin"
  description = "An adminstrative user password"
}

variable "keypair_name" {
  type        = string
  description = "Keypair name"
  default     = "mongo-publicKey"
}

variable "public_key" {
  type        = string
  description = "Public key file path"
}
