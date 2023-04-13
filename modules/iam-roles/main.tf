resource "aws_iam_role" "terraform_role" {
  name               = var.terraform_role_name
  assume_role_policy = data.template_file.terraform_role_trust_policy.rendered
}

resource "aws_iam_policy" "terraform_apply_permissions_policy" {
  name   = var.terraform_apply_permissions_policy_name
  policy = file("${path.module}/policies/terraform-iam-role.json")
}

resource "aws_iam_role_policy_attachment" "terraform_apply_permissions" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = aws_iam_policy.terraform_apply_permissions_policy.arn
}

resource "aws_iam_openid_connect_provider" "github_actions" {
  url             = "https://token.actions.githubusercontent.com"
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
  client_id_list  = ["sts.amazonaws.com"]
}