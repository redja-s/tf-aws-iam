output "aws_iam_group_names" {
    value = {
        for name in aws_iam_groups : name => name
    }
}