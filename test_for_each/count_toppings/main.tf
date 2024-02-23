locals {
  toppings = ["letuce", "tomatoes", "jalapenos"]
}

resource "local_file" "count_loop" {
  count = length(local.toppings)
  content = "${local.toppings[count.index]}"
  filename = "${path.module}/${local.toppings[count.index]}.count"
}