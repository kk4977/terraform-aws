resource "aws_instance" "db" {
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type

    tags = {
    Name = "db"
    }
    
  }
resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description

    ingress {
        from_port = var.ssh_port
        to_port = var.ssh_port
        protocol = var.protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0 # '0' means opening all ports
        to_port = 0   # '0' means opening all ports
        protocol = -1  # '-1' means opening all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = " sivakumar kadali"
    }
}