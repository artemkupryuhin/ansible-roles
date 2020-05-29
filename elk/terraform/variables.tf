variable "region" {
    default = "us-east-2"
    description = "Amazon region"
}
variable "profile" {
    default = "sergii"
    description = "Amazon profile"
}
variable "ami" {
    default = "ami-0fc20dd1da406780b"
    #default = "ami-0f7919c33c90f5b58"
}
variable "count" {
    default = 3
    description = "EC2 count instances"
}
variable "ssh-private-key" {
    default = "~/.ssh/id_rsa"
    description = "Path to the file with private ssh key"
}
variable "ssh-public-key" {
    default = "~/.ssh/id_rsa.pub"
    description = "Path to the file with public ssh key"
}
variable "subnet_id" {
    default = "subnet-b632cffa"
} 
variable "name" {
    default = "sergiielasticsearch"
}
variable "user" {
    default = "ubuntu"
    #default = "ec2-user"
}