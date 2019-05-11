## Required Inputs

The following input variables are required:

### dynamo\_hash\_key

Description: Hash key for DynamoDB table

Type: `string`

### dynamo\_hash\_key\_type

Description: Type of DynamoDB hash key

Type: `string`

### dynamo\_table\_name

Description: Name of DynamoDB table

Type: `string`

### lambda\_cron\_expression

Description: Cron expression for scheduling lambda calls. Format like: cron(0 0 * * ? *)

Type: `string`

### lambda\_function\_name

Description: Name given to the lambda function

Type: `string`

### lambda\_role

Description: IAM role for lambda function

Type: `string`

### lambda\_trigger\_description

Description: Description for lambda cloudwatch trigger

Type: `string`

### lambda\_trigger\_name

Description: Name of lambda trigger

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### cloudwatch\_target\_id

Description: Target ID for cloudwatch event

Type: `string`

Default: `""`

### dynamo\_has\_sort\_key

Description: Boolean, true if a sort key exists, false if not

Type: `Boolean`

Default: `"false"`

### dynamo\_read\_capacity

Description: Read capacity for dynamoDB table

Type: `string`

Default: `"2"`

### dynamo\_sort\_key

Description: Sort key for DynamoDB table

Type: `string`

Default: `"null"`

### dynamo\_sort\_key\_type

Description: Type of DynamoDB sort key

Type: `string`

Default: `"null"`

### dynamo\_write\_capacity

Description: Write capacity for dynamoDB table

Type: `string`

Default: `"2"`

### environment\_variables

Description: Environment variables

Type: `map`

Default: `<map>`

### lambda\_code\_s3\_bucket\_existing

Description: Existing 'aws_s3_bucket.bucket'

Type: `string`

Default: `"defaultBucket"`

### lambda\_code\_s3\_bucket\_new

Description: S3 bucket with source code

Type: `string`

Default: `"defaultBucket"`

### lambda\_code\_s3\_bucket\_use\_existing

Description: Boolean flag to specify whether to use 'lambda_code_s3_bucket_new' and create new bucket or to use 'lambda_code_s3_bucket_existing and use existing S3 bucket and now a generate new one

Type: `Boolean`

Default: `"true"`

### lambda\_code\_s3\_bucket\_visibility

Description: S3 bucket ACL

Type: `string`

Default: `"private"`

### lambda\_code\_s3\_key

Description: Location of Lambda code in S3 bucket

Type: `string`

Default: `"defaultS3Key"`

### lambda\_code\_s3\_storage\_class

Description: Lambda code S3 storage class

Type: `string`

Default: `"ONEZONE_IA"`

### lambda\_file\_name

Description: Path to lambda code zip

Type: `string`

Default: `"default.zip"`

### lambda\_runtime

Description: Runtime environment for lambda function

Type: `string`

Default: `"nodejs8.10"`

### lambda\_zip\_path

Description: Local path to Lambda zip code

Type: `string`

Default: `"defaultZipPath"`

### region

Description: Region for lambda and DynamoDB

Type: `string`

Default: `"us-east-1"`

### tags

Description: Tags for lambda

Type: `map`

Default: `<map>`

