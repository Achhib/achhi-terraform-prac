terraform {
    backend "s3" {
      bucket        = "achhis3bucke"
      region        =  "ap-southeast-1"
      key           = "day_four/terraform.tfstate" # Path within the bucket where the state will be read/written.
      dynamodb_table = "terraform-state-lock-dynamo" # DynamoDB table used for state locking, note: first run day-4-bckend resources then day-5-backend config
      encrypt        = true  # Ensures the state is encrypted at rest in S3.
    }
  
}