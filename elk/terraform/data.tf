data "template_file" "hosts" {
  template = <<EOF
elastic:
  hosts:
%{ for name, ip in jsondecode(elasticsearch_nodes) ~}
    $${name}:
      ansible_ssh_host: $${ip}
%{ endfor ~}
all:
  vars:
    ansible_user: ${var.user}
    ansible_ssh_private_key_file: ${var.ssh-private-key}
    ansible_ssh_extra_args: '-o StrictHostKeyChecking=no'
  EOF
  vars = {
    elasticsearch_nodes = "${jsonencode(zipmap(aws_instance.ec2-elasticsearch.*.tags.Name, aws_instance.ec2-elasticsearch.*.public_ip))}"
  }
}