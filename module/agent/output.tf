# output "ssh" {
#   value = ["ssh -i ${var.key_path}/${var.key_name}.pem ubuntu@${aws_instance.agent.*.public_ip}"]
# }

output "public_ip" {
  value = ["${aws_instance.agent.*.public_ip}"]
#  value = ["ssh -i ${var.key_path}/${var.key_name}.pem ubuntu@${aws_instance.agent.*.public_ip}"]

}