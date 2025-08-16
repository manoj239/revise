resource "null_resource" "cluster" {
  count = var.environment == "dev" || var.environment == "DEV" ? 3 : 0
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:/Users/mborra/Downloads/Remote.pem")
      #host       = "${aws_instance.web-1.public_ip}"
      host = element(aws_instance.public-servers.*.public_ip, count.index)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo apt update",
      "sudo apt install -y tree"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:/Users/mborra/Downloads/Remote.pem")
      #host       = "${aws_instance.web-1.public_ip}"
      host = element(aws_instance.public-servers.*.public_ip, count.index)
    }
  }

  #This resource will be recreated if there is a change in tag version.
  triggers = {
    public-servers-tags = element(aws_instance.public-servers.*.tags.Version, count.index)
  }
}
