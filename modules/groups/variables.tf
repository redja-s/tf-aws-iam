variable "aws_iam_groups" {
    type = map(object({
        name = string
    }))
}