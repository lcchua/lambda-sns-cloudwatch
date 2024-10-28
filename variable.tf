variable lambda_function_name {
    description     = "Name of lambda function"
    type            = string
    default         = "lcchua-tf-lambda-fn"
}

variable lambda_file_name {
    description     = "Name of lambda file to be zipped"
    type            = string
    default         = "lambda_function"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = "vpc-033addf3a46d7960e" // to be updated
}

variable "sg_id" {
    description = "The security group id"
    type        = string
    default     = "sg-05ff8047411fe813c" // to be updated
}

variable "sns_name" {
    description = "The name of the SNS topic"
    type        = string
    default     = "lcchua-successful-sns-topic"
}