output "aws_s3_bucket" {
    value = aws_s3_bucket.terraform_state.arn
    description = "The ARN of the s3 bucket"
}

output "aws_dynamodb_table" {
    value = aws_dynamodb_table.terraform_locks.name
    description = "The name of the Dynamodb table"
}