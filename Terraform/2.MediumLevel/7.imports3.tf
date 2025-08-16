resource "aws_s3_bucket" "fancybucket" {
  bucket        = "sitharamanoj"
  force_destroy = true

  tags = {
    Name        = "sitharamanoj"
    Environment = var.environment
  }
}

#force_destroy = true → Allows the bucket to be deleted even if it contains objects.Without 
#this, Terraform will fail to destroy a bucket if it’s not empty.
#------------------------
#resource "aws_s3_bucket" "devopspracticestatefiles" {
#  provider = aws.n_virginia
#  bucket   = "vinithahomes"
#}
