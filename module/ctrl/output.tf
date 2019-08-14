output "controller_public_ip" {
  value = "${aws_instance.controller_public.public_ip}"
}

output "controller_private_ip" {
  value = "${aws_instance.controller_public.private_ip}"
}

output "controller_address" {
  value = "${aws_instance.controller_public.public_ip}:8080/ngrinder-controller-3.4.3"
}
output "controller_private_address" {
  value = "${aws_instance.controller_public.private_ip}:8080/ngrinder-controller-3.4.3"
}

output "common_sg" {
  value = "${aws_security_group.this.id}"
}


output "ssh" {
  value = "ssh -i ${var.key_path}/${var.key_name}.pem ubuntu@${aws_instance.controller_public.public_ip}"
}

output "ngrinder_connect" {
    value = "Let's go to site : ${aws_instance.controller_public.public_ip}:8080"
#    value = "Let's go to site : ${aws_instance.controller_public.public_ip}:8080/ngrinder-controller-3.4.3"
}