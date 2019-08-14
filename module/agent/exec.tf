resource "null_resource" "example_provisioner" {
  count = var.agent_count
  
  triggers = {
    public_ip = "${aws_instance.agent[count.index].public_ip}"
  }

  connection {
    type = "ssh"
    host = "${aws_instance.agent[count.index].public_ip}"
    user = "ubuntu"
    port = "22"
    agent = true
    private_key = file("${var.key_path}/${var.key_name}.pem")
  }

  provisioner "file" {
    source      = "${path.module}/files/install-ngrinder-agent.sh"
    destination = "/tmp/install-ngrinder-agent.sh"
  }

  // change permissions to executable and pipe its output into a new file

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install-ngrinder-agent.sh",
      "/tmp/install-ngrinder-agent.sh ${var.controller_ip}",
      "sleep 1"
    ]
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt update",
  #     "sudo apt install openjdk-8-jre-headless -y",
  #     "wget http://${var.controller_ip}:8080/agent/download -O agent.tar",
  #     "tar -xf agent.tar",
  #     "nohup agent/run_agent.sh -o &",
  #     "sleep 1"
  #   ]
  # }

}