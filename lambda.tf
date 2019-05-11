locals {
  s3_bucket = "${var.lambda_code_s3_bucket_use_existing ? var.lambda_code_s3_bucket_existing : join("", aws_s3_bucket.lambda_repo.*.bucket)}"
}

resource "aws_lambda_function" "lambda" {
  count            = "${var.lambda_file_name == "default.zip" ? 0 : 1}"
  function_name    = "${var.lambda_function_name}"
  handler          = "index.handler"
  runtime          = "${var.lambda_runtime}"
  filename         = "${var.lambda_file_name}"
  source_code_hash = "${base64sha256(file("${var.lambda_file_name}"))}"
  role             = "${aws_iam_role.lambda-iam-role.arn}"
  environment {
    variables = "${var.environment_variables}"
  }
}

resource "aws_lambda_function" "lambda_s3" {
  count            = "${var.lambda_file_name == "default.zip" ? 1 : 0}"
  function_name    = "${var.lambda_function_name}"
  handler          = "index.handler"
  runtime          = "${var.lambda_runtime}"
  source_code_hash = "${aws_s3_bucket_object.lambda_dist.etag}"
  s3_bucket        = "${local.s3_bucket}"
  s3_key           = "${var.lambda_code_s3_key}"
  role             = "${aws_iam_role.lambda-iam-role.arn}"
  environment {
    variables = "${var.environment_variables}"
  }
}

resource "aws_s3_bucket" "lambda_repo" {
  count                       = "${var.lambda_file_name == "default.zip" && var.lambda_code_s3_bucket_existing == "defaultBucket" && var.lambda_code_s3_bucket_new != "defaultBucket" ? 1 : 0}"
  bucket                      = "${var.lambda_code_s3_bucket_new}"
  region                      = "${var.region}"
  acl                         = "${var.lambda_code_s3_bucket_visibility}"
  tags                        = "${var.tags}"
}

resource "aws_s3_bucket_object" "lambda_dist" {
  count                       = "${var.lambda_file_name == "default.zip" && (var.lambda_code_s3_bucket_existing != "defaultBucket" || var.lambda_code_s3_bucket_new != "defaultBucket") ? 1 : 0}"
  bucket                      = "${local.s3_bucket}"
  key                         = "${var.lambda_code_s3_key}"
  source                      = "${var.lambda_zip_path}"
  etag                        = "${md5(file(var.lambda_zip_path))}"
  storage_class               = "${var.lambda_code_s3_storage_class}"
}
