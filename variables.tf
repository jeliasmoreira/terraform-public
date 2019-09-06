#Declaracao de variaveis

variable "access_key" {
  description ="Valor da acces_key criada para autentica no IAM"
  default = ""
}
variable "secret_key" {
  description ="Valor da secret_access_key criada para autentica no IAM"
  default = ""
}
variable "aws_region" {
  description ="Valor da regiao da aws que ira ser trabalhada - neste caso Sao Paulo"
  default = "sa-east-1"
}

variable "aws_az1" {
  description ="Valor da primeira zona de disponidade da regiao selecionada"
  default = "sa-east-1a"
}

variable "aws_az2" {
  default = "sa-east-1c"
}

variable "vpc_name" {
  default = "cloudprep"
}
variable "terraform" {
  default = "terraform"
}
variable "vpc_cidr" {
  default = "192.168.80.0/23"
}
variable "cidr_east-1a" {
  default = "192.168.80.0/24"
}
variable "cidr_east-1c" {
  default = "192.168.81.0/24"
}
variable "key_name" {
  default = "webserver01"
}

variable "ami_webserver" {
  default = "ami-058943e7d9b9cabfb"
}

variable "app_git" {
  description = "Endereço do repositorio GIT onde esta o html a ser implantado no apache"
  default     ="https://github.com/jeliasmoreira/html_terraform.git"
  
}
