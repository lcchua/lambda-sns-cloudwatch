# Comment out the below if you are working on local

terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate-bucket"
    key    = "lambda-sns-cloudwatch-lcchua.tfstate" 
    region = "us-east-1"
  }
}