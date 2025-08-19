resource "aws_iam_policy_attachment" "test-attach" {
  name       = var.iam_policy_name
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.policy.arn
}