# Defines the lambda function code that will be zipped

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "./files/${var.lambda_file_name}.py"
  output_path = "./files/${var.lambda_file_name}.zip"
}

# Defines the lambda function to be created using file

resource "aws_lambda_function" "own_lambda" {
  function_name    = var.lambda_function_name
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.10"
  role              = aws_iam_role.iam_for_lambda.arn
  filename         = data.archive_file.lambda.output_path                      # Adjust the path
  source_code_hash = data.archive_file.lambda.output_base64sha256               # Adjust the path

  environment {
    variables = {
      DESTINATION_SNS_ARN = aws_sns_topic.destination_sns_topic.arn
    }
  }
}
