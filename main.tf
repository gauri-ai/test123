resource "aws_s3_bucket" "s3_bucket" {
  for_each = toset(var.bucket_names)
bucket = each.value
}

variable "bucket_names" {
  type    = list(string)
  default = ["xyzbucket001", "xyzbucket002", "xyzbucket003","xyzbucket004","xyzbucket005","xyzbucket006"]
}

___________________________________________________________
variable "bucket_count" {
  type	= number
  default = 3
}
locals {
  bucket_names = [for i in range(var.bucket_count) : "xyzbucket00-${i + 1}"]
}
resource "aws_s3_bucket" "infrasity" {
  for_each = toset(locals.bucket_names)
  bucket   = each.key
}

