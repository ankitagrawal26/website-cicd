# Configure the AWS Provider for ACM in us-east-1
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"  # ACM Certificate must be in this region
}

# Create an ACM certificate in us-east-1 for the domain
resource "aws_acm_certificate" "cert" {
  provider = aws.us_east_1

  domain_name       = "your domain name"
  validation_method = "DNS"

  subject_alternative_names = [
    "www.example.com"
  ]

  tags = {
    Name = "choose one"
  }
}