data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "inline_policy_sns" {
  statement {
    actions   = ["sns:Publish"]
    resources = ["arn:aws:sns:us-east-1:255945442255:${var.sns_name}"]
  }
}

data "aws_iam_policy_document" "inline_policy_cloudwatch" {
  statement {
    actions   = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        ]
    resources = ["arn:aws:logs:us-east-1:255945442255:log-group:/aws/lambda/${var.lambda_function_name}:*"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_luqman_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  inline_policy {
    name   = "policy-sns"
    policy = data.aws_iam_policy_document.inline_policy_sns.json
  }

  inline_policy {
    name   = "policy-cloudwatch"
    policy = data.aws_iam_policy_document.inline_policy_cloudwatch.json
  }
}
