provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  # Using a deprecated attribute
  associate_public_ip_address = true

  tags = {
    Name = "example-instance"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-terraform"

  # Using deprecated lifecycle rules
  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/" # This is deprecated, use filter instead

    expiration {
      days = 90
    }
  }

  tags = {
    Name        = "example-bucket"
    Environment = "Dev"
  }
}
