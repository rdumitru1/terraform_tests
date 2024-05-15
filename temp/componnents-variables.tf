variable "vpc_cidr" {
  description = "The cidr block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "log_group_name" {
  description = "Name of the log group"
  type        = string
}

variable "retention_days" {
  description = "Number of days that the logs should be kept"
  type        = number
}

variable "create_flow_log" {
  description = "A bollean flag to enable flow log."
  type        = bool
}

variable "traffic_type" {
  description = "Traffic type that flow log needs to capture."
  type        = string
}

variable "create_igw" {
  description = "A boolean flag if an internet gateway should be created or not."
  type        = bool
}

variable "one_pub_sub_per_az" {
  description = "A boolean flag if public subnets should be created for all AZs."
  type        = bool
}

variable "application_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "public_cidrs" {
  description = "A custom list of public cidr blocks that needs to be created."
  type = list(string)
}

variable "application_cidrs" {
  description = "A custom list of application cidr blocks that needs to be created."
  type = list(string)
}

variable "database_cidrs" {
  description = "A custom list of database cidr blocks that needs to be created."
  type = list(string)
}

variable "create_public_subnet" {
  description = "A boolean flag to create custom public subnets"
  type        = bool
}

variable "one_app_sub_per_az" {
  description = "A boolean flag if private subnets should be created for all AZs."
  type        = bool
}

variable "create_application_subnet" {
  description = "A boolean flag to create custom application subnets"
  type        = bool
}

variable "public_inbound_nacl_rules" {
  description = "List of public Network ACLs inbound rules"
  type        = list(map(string))
  default     = []
}

variable "public_outbound_nacl_rules" {
  description = "List of public Network ACLs outbound rules"
  type        = list(map(string))
  default     = []
}

variable "application_inbound_nacl_rules" {
  description = "List of application Network ACLs inbound rules"
  type        = list(map(string))
  default     = []
}

variable "database_inbound_nacl_rules" {
  description = "List of database Network ACLs inbound rules"
  type        = list(map(string))
  default     = []
}

variable "database_outbound_nacl_rules" {
  description = "List of database Network ACLs inbound rules"
  type        = list(map(string))
  default     = []
}

variable "application_outbound_nacl_rules" {
  description = "List of application Network ACLs outbound rules"
  type        = list(map(string))
  default     = []
}

variable "one_db_sub_per_az" {
  description = "A boolean flag if database subnets should be created for all AZs."
  type        = bool
}

variable "database_subnets" {
  description = "A custom list of database subnets that needs to be created."
  type        = list(string)
}

variable "create_database_subnet" {
  description = "A boolean flag to create custom database subnets"
  type        = bool
}

variable "environment" {
  description = "The name of this environment."
  type        = string
}

variable "create_endpoints" {
  description = "A boolean flag to create VPC Endpoints"
  type        = bool
}

variable "interface_vpc_endpoints" {
  description = "List of Interface VPC Endpoints"
  type        = list(map(string))
  default     = []
}

variable "gateway_vpc_endpoints" {
  description = "List of Gateway VPC Endpoints"
  type        = list(map(string))
  default     = []
}

variable "create_vpc_endpoint_sg" {
  description = "A boolean flag to create VPC endpoint Security Groups"
  type        = bool
}

variable "security_groups" {
  description = "Security Group rules"
  type = map(map(list(map(any))))
  default = {}
}

variable "project_id" {
  description = "VWG UK project ID"
  type        = string
}

variable "owner" {
  description = "Owner of the account"
  type = string
}

variable "maintainer" {
  description = "Maintainer of the code"
  type = string
}

variable "provisioner" {
  description = "Provisioner of the code"
  type = string
}

variable "terraform" {
  description = "If resource was provisioned using terraform"
  type = string
}

variable "nat_gateway" {
  description = "A boolean flag to create NAT Gateways"
  type = bool
}

variable "one_natgw_per_az" {
  description = "A boolean flag to create one NAT Gateway on every Availability Zone"
  type = bool
}

# Code Artifact KMS key variables
variable "bypass_policy_lockout_safety_check" {
  description = "Boolean flag to indicate whether to bypass the key policy lockout safety check."
  type = bool
}

variable "customer_master_key_spec" {
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports."
  type = string
}

variable "deletion_window_in_days" {
  description = "The waiting period until the KMS key is deleted."
  type = number
}

variable "kms_description" {
  description = "The description of the key as viewed in AWS console."
  type = string
}

variable "enable_key_rotation" {
  description = "Boolean flag that specifies whether key rotation is enabled."
  type = bool
}

variable "kms_is_enabled" {
  description = "Boolean flag that specifies whether the key is enabled."
  type = bool
}

variable "key_usage" {
  description = "Specifies the intended use of the key."
  type = string
}

variable "kms_multi_region" {
  description = "Boolean flag that indicates whether the KMS key is a multi-Region or regional key."
  type = bool
}

# Code Artifact Variables
variable "ca_domain" {
  description = "Code Artifact domain name."
  type = string
}

variable "ca_repo_name" {
  description = "Code Artifact repository name."
  type = string
}

# EFS Variables
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

variable "creation_token" {
  description = "The name of the EFS. A unique name used as reference when creating the Elastic File System to ensure idempotent file system creation."
  type        = list(string)
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
