resource "aws_dynamodb_table" "table_sorted" {
  count          = "${var.dynamo_has_sort_key ? 1 : 0}"
  name           = "${var.dynamo_table_name}"
  read_capacity  = "${var.dynamo_read_capacity}"
  write_capacity = "${var.dynamo_write_capacity}"
  hash_key       = "${var.dynamo_hash_key}"
  sort_key       = "${var.dynamo_sort_key}"
  attribute      = [
    {
      name = "${var.dynamo_hash_key}",
      type = "${var.dynamo_hash_key_type}"
    },
    {
      name = "${var.dynamo_sort_key}",
      type = "${var.dynamo_sort_key_type}"
    }
  ]
}

resource "aws_dynamodb_table" "table" {
  count          = "${var.dynamo_has_sort_key ? 0 : 1}"
  name           = "${var.dynamo_table_name}"
  read_capacity  = "${var.dynamo_read_capacity}"
  write_capacity = "${var.dynamo_write_capacity}"
  hash_key       = "${var.dynamo_hash_key}"
  attribute      = [
    {
      name = "${var.dynamo_hash_key}",
      type = "${var.dynamo_hash_key_type}"
    }
  ]
}