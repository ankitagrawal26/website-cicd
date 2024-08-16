# Define the Route 53 DNS zone
data "aws_route53_zone" "dns_zone" {
  name         = "silas-teixeira.com."
  private_zone = false
}

# Create a Route 53 record to point to the CloudFront distribution
resource "aws_route53_record" "a_record" {
  zone_id = data.aws_route53_zone.dns_zone.id
  name    = "silas-teixeira.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.website_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
