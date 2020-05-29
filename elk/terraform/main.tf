provider "aws" {
  region   = "${var.region}"
  profile  = "${var.profile}"
}
resource "aws_key_pair" "ssh" {
  key_name   = "sergii-web-api-sshkey"
  public_key = "${file(var.ssh-public-key)}"
}
resource "aws_instance" "ec2-elasticsearch" {
   count                    = "${var.count}"
   ami                      = "${var.ami}"
   instance_type            = "t2.small"
   key_name                 = "${aws_key_pair.ssh.key_name}"
   vpc_security_group_ids   = ["${aws_security_group.elasticsearch-sg.id}"]
   subnet_id                = "${var.subnet_id}"
   tags = {
     Name = "${var.name}-${count.index+1}"
     }
     connection {
       private_key = "${file(var.ssh-private-key)}"
       user        = "${var.user}"
     }
     provisioner "remote-exec" {
       inline = ["uptime"]
     }
}
resource "local_file" "hosts" {
  content  = "${data.template_file.hosts.rendered}"
  filename = "../hosts.yml"
}

resource "null_resource" "ansible_playbook" {
  depends_on = ["aws_instance.ec2-elasticsearch",
                "local_file.hosts"]
  triggers {
    ansible_time = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = <<EOT
       ansible-playbook -i ../hosts.yml --ask-vault-pass -b ../elk-role.yml 
    EOT
  }
}