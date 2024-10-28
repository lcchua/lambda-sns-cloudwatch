resource "aws_sns_topic" "destination_sns_topic" {
  name = var.sns_name
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.destination_sns_topic.arn
  protocol  = "email"
  endpoint  = "luqmanforaws@gmail.com"
}