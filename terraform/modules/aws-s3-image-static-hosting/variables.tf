variable "bucket_name" {
  description = "s3 bucket name"
  type        = string
}

variable "tags" {
  description = "Tags to be set on the s3 bucket."
  type        = map(string)
  default     = {}
}
