variable "AWS_REGION" {
  default = "us-west-2"
}

variable "keypair_name" {
  type        = string
  description = "Keypair name"
  default     = "mongo-publicKey"
}
