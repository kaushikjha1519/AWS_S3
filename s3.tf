provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket="kaushikbucket1519"
}

//resource "aws_s3_bucket_acl" "my_bucket_acl" {
    //bucket=aws_s3_bucket.my_bucket.id
    //acl="private"
  
//}
resource "aws_s3_bucket_ownership_controls" "my_buket_owenrship" {
  bucket=aws_s3_bucket.my_bucket.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
resource "aws_s3_bucket_public_access_block" "my_bucket_block" {
    bucket = aws_s3_bucket.my_bucket.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  //ignore_public_buckets=true
  restrict_public_buckets = true
}

//ARN stands for amazon resource name 
//ACL stands for access control list it is a security feature that is used to control permissions for AWS resources particulary s3 buckets and VPCs
