provider "aws" {
  region ="ap-south-1"
  access_key = "xxxxxxxxxxxxx" 
  secret_key = "xxxxxxxxxxxxxxxxxx"
}

resource "aws_instance" "web" {
  ami = "ami-00782a7608c7fc226"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-05bb9a530211c7d93"]
  user_data = file("jenkins.sh")
  availability_zone = "ap-south-1a"
  key_name = "iamubumtu" 
  tags = {
    Name = "Master"
  }
}
resource "aws_instance" "web1" {
  ami = "ami-00782a7608c7fc226"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-05bb9a530211c7d93"]
  user_data  = file("docker.sh")
  key_name = "iamubumtu"
  availability_zone = "ap-south-1a" 
  tags = {
    Name = "Node1"
  }
}
resource "aws_instance" "web2" {
  ami = "ami-026f33d38b6410e30"
  instance_type = "t2.medium"
  vpc_security_group_ids = ["sg-05bb9a530211c7d93"]
  key_name = "iamubumtu"
  user_data = file("k8ansible.sh")
  availability_zone = "ap-south-1a" 
  tags = {
    Name = "K8master"
  }
}
resource "aws_instance" "web3" {
  ami = "ami-026f33d38b6410e30" 
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-05bb9a530211c7d93"]
  key_name = "iamubumtu"
  availability_zone = "ap-south-1a" 
  tags = {
    Name = "Workernode"
  }
}
resource "aws_instance" "web4" {
  ami = "ami-00782a7608c7fc226"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-05bb9a530211c7d93"]
  user_data  = file("docker.sh")
  key_name = "iamubumtu"
  availability_zone = "ap-south-1a" 
  tags = {
    Name = "Heroku"
  }
}
resource "aws_autoscaling_group" "bar" {
  availability_zones = ["ap-south-1a"]
  desired_capacity = 5
  max_size  = 10
  min_size  = 5

  launch_template {
    id  = aws_launch_template.web4.id
    version  = "$Latest"
  }
  
  launch_template {
    id  = aws_launch_template.web3.id
    version  = "$Latest"
  }
  
  launch_template {
    id  = aws_launch_template.web2.id
    version  = "$Latest"
  }
  
  launch_template {
    id  = aws_launch_template.web1.id
    version  = "$Latest"
  }
  
  launch_template {
    id  = aws_launch_template.web.id
    version  = "$Latest"
  }
}


