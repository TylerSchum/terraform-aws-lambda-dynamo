output "dynamodb_table_name" {
  value = "${join("", concat(aws_dynamodb_table.table.*.name, aws_dynamodb_table.table_sorted.*.name))}"
}

output "dynamodb_table_arn" {
  value = "${join("", concat(aws_dynamodb_table.table.*.arn, aws_dynamodb_table.table_sorted.*.arn))}"
}

output "lambda_s3_bucket" {
  value = "${var.lambda_file_name == "default.zip" ? join(",", aws_s3_bucket.lambda_repo.*.bucket) : ""}"
}

output "lambda_name" {
  value = "${var.lambda_file_name == "default.zip" ? join(",", aws_lambda_function.lambda_s3.*.function_name) : join(",", aws_lambda_function.lambda.*.function_name)}"
}

output "lambda_arn" {
  value = "${var.lambda_file_name == "default.zip" ? join(",", aws_lambda_function.lambda_s3.*.arn) : join(",", aws_lambda_function.lambda.*.arn)}"
}