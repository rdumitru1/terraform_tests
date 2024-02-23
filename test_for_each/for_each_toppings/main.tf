locals {
  toppings = ["letuce", "tomatoes", "jalapenos"]
}

resource "local_file" "for_each_loop" {
  for_each = toset(local.toppings)
  content = "${each.value}"
  filename = "${path.module}/${each.value}.foreach"
}
