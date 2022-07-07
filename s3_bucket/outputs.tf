output "s3_bucket_name" {
  value = aws_s3_bucket.training_bucket.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.training_bucket.arn
}

output "s3_bucket_tags" {
  value = aws_s3_bucket.training_bucket.tags_all
}
