# Tagging Variables
variable "environment" {
  description = "The name of this environment."
  type        = string
}

variable "owner" {
  description = "Owner of the account"
  type        = string
}

variable "maintainer" {
  description = "Maintainer of the code"
  type        = string
}

variable "provisioner" {
  description = "Provisioner of the code"
  type        = string
}

variable "terraform" {
  description = "If resource was provisioned using terraform"
  type        = string
}

# KMS Variables
variable "creation_token" {
  description = "The name of the EFS. A unique name used as reference when creating the Elastic File System to ensure idempotent file system creation."
  type        = list(string)
}

variable "ca_efs_kms_key_arn" {
  description = "ID of the Code Artifact/EFS filesystem kms key."
  type = string
}

variable "efs_az" {
  description = "AWS Availability Zone in which to create the file system."
  type        = string
  default = ""
}

variable "encrypted" {
  description = "A boolean flag if the disk will be encrypted."
  type        = bool
}

variable "performance_mode" {
  description = "The file system performance mode."
  type = string
}

variable "throughput_mode" {
  description = "Throughput mode for the file system."
  type = string
}

variable "provisioned_throughput_in_mibps" {
  description = "The throughput, measured in MiB/s, that you want to provision for the file system."
  type = number
  default = null
}

variable "lifecycle_policy" {
  description = "EFS filesystem lifecycle policy."
  type = list(object({
    transition_to_ia                    = optional(string)
    transition_to_primary_storage_class = optional(string)
  }))
  default = []
}

# EFS Access Point variables
variable "posix_user" {
  description = "Operating system user and group applied to all file system requests made using the access point."
  type = list(object({
    gid            = number
    secondary_gids = optional(list(number))
    uid            = number
  }))
  default = []
}

variable "root_directory" {
  description = "The access point exposes the specified file system path as the root directory of your file system to applications using the access point."
  type = list(object({
    path         = optional(string)
    creation_info = optional(object({
      owner_gid   = number
      owner_uid   = number
      permissions = string
    }))
  }))
  default = []
}

variable "vpc_id" {
  description = "The VPC id."
  type = string
}

# EFS Mount Target Variables
variable "app_subnet_ids" {
  description = "Application subnets."
  type = list(string)
}

# Security Group Variables
variable "efs_sg_name" {
  description = "The name of the Security Group."
  type = string
}

variable "sg_ingress_rules" {
  description = "Ingress rules"
  type = list(object({
    description     = optional(string)
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
    self            = optional(bool)
  }))
  default = []
}

variable "sg_egress_rules" {
  description = "Egress rule"
  type = list(object({
    description = optional(string)
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string))
  }))
  default = []
}
