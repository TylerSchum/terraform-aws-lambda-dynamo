resource "aws_cloudwatch_event_rule" "lambda-event-rule" {
  name                = "${var.lambda_trigger_name}"
  description         = "${var.lambda_trigger_description}"
  schedule_expression = "${var.lambda_cron_expression}"
}

resource "aws_lambda_permission" "cloudwatch_trigger" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${join("", concat(aws_lambda_function.lambda_s3.*.arn, aws_lambda_function.lambda.*.arn))}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.lambda-event-rule.arn}"
}

resource "aws_cloudwatch_event_target" "lambda" {
  count     = "${var.cloudwatch_target_id == "" ? 1 : 0}"
  rule      = "${aws_cloudwatch_event_rule.lambda-event-rule.name}"
  arn       = "${join("", concat(aws_lambda_function.lambda_s3.*.arn, aws_lambda_function.lambda.*.arn))}"
}

resource "aws_cloudwatch_event_target" "lambda_custom_target" {
  count     = "${var.cloudwatch_target_id == "" ? 0 : 1}"
  target_id = "${var.cloudwatch_target_id}"
  rule      = "${aws_cloudwatch_event_rule.lambda-event-rule.name}"
  arn       = "${join("", concat(aws_lambda_function.lambda_s3.*.arn, aws_lambda_function.lambda.*.arn))}"
}
