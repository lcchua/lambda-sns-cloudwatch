# Integrating AWS Lambda with SNS and Cloudwatch

## What is AWS Lambda?
AWS Lambda is a serverless, event-driven compute service that lets you run code for virtually any type of application or backend service without provisioning or managing servers. You can trigger Lambda from over 200 AWS services and software as a service (SaaS) applications, and only pay for what you use.

A simple flow might be like the one below:
![image](https://github.com/luqmannnn/lambda-sns-cloudwatch/assets/9068525/d38ac4e7-50b5-4635-b15c-ed9096f604ac)

In our activity, we will be creating a Lambda function that will send an email to its subscribers.

## What is AWS SNS?
Amazon Simple Notification Service (Amazon SNS) is a fully managed pub/sub messaging service provided by Amazon Web Services (AWS). It enables you to build distributed applications and microservices by allowing them to communicate with each other.

![image](https://github.com/luqmannnn/lambda-sns-cloudwatch/assets/9068525/8625fe96-8fd4-4604-89a9-422196b3aa8d)

You can even use SNS to produce emails/ SMS texts to your intended recipients.

![image](https://github.com/luqmannnn/lambda-sns-cloudwatch/assets/9068525/baae3905-3786-468a-8f89-39c8ca4996e6)

## Requirements
To get started, we will need to create a few resources below:

### IAM
IAM roles for AWS Lambda to be able to create AWS Cloudwatch log groups and publish logs to Cloudwatch, as well as to publish messages via SNS.

### Simple Python Code
We will use a simple python code (under lambda_function.py) that will utilize boto3 client to connect and send messages to SNS.
This code will take in 3 parameters: name, time and weather.

### Lambda
We will then create the AWS lambda resource with the above python code.

### SNS
We will also create an SNS topic and create a subscription for an intended email to receive messages.

<img width="1299" alt="Screenshot 2023-10-02 at 7 13 55 PM" src="https://github.com/luqmannnn/lambda-sns-cloudwatch/assets/9068525/72b81bc4-5d43-4dba-b93e-5585c229b375">

## End Goal
Should everything be set up successfully, we will be able to receive an email notification with the parameters we have specified, for example:

<img width="811" alt="Screenshot 2023-10-02 at 7 15 10 PM" src="https://github.com/luqmannnn/lambda-sns-cloudwatch/assets/9068525/516be494-a80b-40bf-a140-947eb46cc2f0">

## Clean Up
Once done, remove all the resources that have been created:
1. SNS Topic
2. Lambda Function
3. IAM roles
