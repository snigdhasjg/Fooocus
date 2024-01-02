output "ec2" {
  value = {
    instance_id = aws_instance.this.id

    private = {
      ip  = aws_instance.this.private_ip
      dns = aws_instance.this.private_dns
    }

    public = {
      ip  = aws_instance.this.public_ip
      dns = aws_instance.this.public_dns
    }
  }
}