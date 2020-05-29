output "elasticsearch-names" {
  value = "${aws_instance.ec2-elasticsearch.*.tags.Name}"
}
output "elasticsearch-public_ips" {
  value = "${aws_instance.ec2-elasticsearch.*.public_ip}"
}
output "elasticsearch-private_ips" {
  value = "${aws_instance.ec2-elasticsearch.*.private_ip}"
}