resource "null_resource" "example_provisioner" {
  triggers = {
    public_ip = "${aws_instance.controller_public.public_ip}"
  }

  connection {
    type = "ssh"
    host = "${aws_instance.controller_public.public_ip}"
    user = "ubuntu"
    port = "22"
    agent = true
    private_key = file("${var.key_path}/${var.key_name}.pem")
  }

  provisioner "file" {
    source      = "${path.module}/files/install-ngrinder.sh"
    destination = "/tmp/install-ngrinder.sh"
  }

  // change permissions to executable and pipe its output into a new file

  // Tips.
  // The reason adding sleep after nohup. 
  // Somebody suspect backgrounding last remote-exec lets
  // Terranform get away with shutting down the connection before child process has a chance to start up.
  // It works well.
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install-ngrinder.sh",
      "/tmp/install-ngrinder.sh",
      "sleep 1"
    ]
  }

  provisioner "local-exec" {
    command = "pwd"
  }

}