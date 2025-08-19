output "s3_arn" {
  value = aws_s3_bucket.s3buckets.arn
}

output "s3_id" {
  value = aws_s3_bucket.s3buckets.id
}