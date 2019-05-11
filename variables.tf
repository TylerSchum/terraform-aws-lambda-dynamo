variable "region" {
  description = "Region for lambda and DynamoDB"
  default = "us-east-1"
}

variable "tags" {
  type = "map"
  description = "Tags for lambda"
  default = {}
}

variable "environment_variables" {
  type = "map"
  description = "Environment variables"
  default = {}
}

variable "lambda_function_name" {
  description = "Name given to the lambda function"
}

variable "lambda_file_name" {
  default = "default.zip"
  description = "Path to lambda code zip"
}

variable "lambda_role" {
  description = "IAM role for lambda function"
}

variable "lambda_runtime" {
  default = "nodejs8.10"
  description = "Runtime environment for lambda function"
}

variable "lambda_code_s3_bucket_new" {
  default = "defaultBucket"
  description = "S3 bucket with source code"
}

variable "lambda_code_s3_bucket_use_existing" {
  default = true
  description = "Boolean flag to specify whether to use 'lambda_code_s3_bucket_new' and create new bucket or to use 'lambda_code_s3_bucket_existing and use existing S3 bucket and now a generate new one"
}

variable "lambda_code_s3_bucket_existing" {
  default = "defaultBucket"
  description = "Existing 'aws_s3_bucket.bucket'"
}

variable "lambda_code_s3_key" {
  default = "defaultS3Key"
  description = "Location of Lambda code in S3 bucket"
}

variable "lambda_code_s3_storage_class" {
  default = "ONEZONE_IA"
  description = "Lambda code S3 storage class"
}

variable "lambda_code_s3_bucket_visibility" {
  default = "private"
  description = "S3 bucket ACL"
}

variable "lambda_zip_path" {
  default = "defaultZipPath"
  description = "Local path to Lambda zip code"
}

variable "lambda_trigger_name" {
  description = "Name of lambda trigger"
}

variable "lambda_trigger_description" {
  description = "Description for lambda cloudwatch trigger"
}

variable "lambda_cron_expression" {
  description = "Cron expression for scheduling lambda calls. Format like: cron(0 0 * * ? *)"
}

variable "dynamo_table_name" {
  description = "Name of DynamoDB table"
}

variable "dynamo_hash_key" {
  description = "Hash key for DynamoDB table"
}

variable "dynamo_hash_key_type" {
  description = "Type of DynamoDB hash key"
}

variable "dynamo_has_sort_key" {
  default = false
  description = "Boolean, true if a sort key exists, false if not"
}

variable "dynamo_sort_key" {
  default = "null"
  description = "Sort key for DynamoDB table"
}

variable "dynamo_sort_key_type" {
  default = "null"
  description = "Type of DynamoDB sort key"
}

variable "dynamo_read_capacity" {
  default = 2
  description = "Read capacity for dynamoDB table"
}

variable "dynamo_write_capacity" {
  default = 2
  description = "Write capacity for dynamoDB table"
}

variable "cloudwatch_target_id" {
  default = ""
  description = "Target ID for cloudwatch event"
}