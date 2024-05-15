# data "aws_iam_policy_document" "retailer-api-app" {
#   dynamic "statement" {
#     for_each = var.applications

#     content {
#       effect = "Allow"
#       actions = [
#         "secretsmanager:GetSecretValue",
#         "secretsmanager:DescribeSecret",
#         "secretsmanager:ListSecretVersionIds"
#       ]

#       resources = statement.value.resources
#     }
#   }
# }

resource "local_file" "for_each_for_loop" {
  for_each = {
    for app in var.applications : app.name => app
  }
  content  = each.value.name
  filename = "${path.module}/${each.key}.for_each_for"
}