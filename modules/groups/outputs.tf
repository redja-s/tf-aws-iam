output "aws_iam_group_names" {
    value = [
        for group in aws_iam_group.groups : group.name
    ]
}