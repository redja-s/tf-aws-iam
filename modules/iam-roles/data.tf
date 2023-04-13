data "template_file" "terraform_role_trust_policy" {
  template = file("${path.module}/policies/terraform-iam-role-assume-policy.tpl")

  vars = {
    oidc_arn = "${aws_iam_openid_connect_provider.github_actions.arn}"
  }
}