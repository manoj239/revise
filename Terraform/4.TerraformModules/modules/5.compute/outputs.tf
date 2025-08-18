output private_servers {
  value       = "${aws_instance.private-servers.*.id}"
}
output public_servers {
  value       = "${aws_instance.public-servers.*.id}"
}

output private_servers_public_ip {
  value       = "${aws_instance.private-servers.*.public_ip}"
}
output private_servers_private_ip {
  value       = "${aws_instance.private-servers.*.private_ip}"
}

output public_servers_public_ip {
  value       = "${aws_instance.public-servers.*.public_ip}"
}
output public_servers_private_ip {
  value       = "${aws_instance.public-servers.*.private_ip}"
}