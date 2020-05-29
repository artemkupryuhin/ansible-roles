resource "aws_security_group" "elasticsearch-sg" {
  name        = "sergiielasticsearch-sg"
  description = "Security group"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH"
    }
    ingress {
        from_port = 9600
        to_port = 9600
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 9603
        to_port = 9603
        protocol = "tcp"
        cidr_blocks = ["172.31.0.0/16"] 
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"] 
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}
