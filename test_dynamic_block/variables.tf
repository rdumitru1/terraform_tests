variable "applications" {
  description = "Applications used in the EKS cluster."
  type = list(object({
    name      = string
    resources = list(string)
  }))
}