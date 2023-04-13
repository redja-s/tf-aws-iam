{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "sts:AssumeRoleWithWebIdentity",
        "Principal": {
            "Federated": "${oidc_arn}"
        },
        "Condition": {
            "StringLike": {
              "token.actions.githubusercontent.com:sub": [
                "repo:redja-s/tf-aws-iam:*",
                "repo:redja-s/app-deployment:*"
              ]
            },
            "StringEquals": {
                "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
            }
        }
      }
    ]
}