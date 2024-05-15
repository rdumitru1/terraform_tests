module "jenkins_vpc" {
  source = "../../modules/vpc"

  azs                       = local.azs
  vpc_cidr                  = var.vpc_cidr
  log_group_name            = var.log_group_name
  retention_days            = var.retention_days
  create_flow_log           = var.create_flow_log
  traffic_type              = var.traffic_type
  create_igw                = var.create_igw
  one_pub_sub_per_az        = var.one_pub_sub_per_az
  one_app_sub_per_az        = var.one_app_sub_per_az
  one_db_sub_per_az         = var.one_db_sub_per_az
  one_natgw_per_az          = var.one_natgw_per_az
  nat_gateway               = var.nat_gateway
  application_subnets       = var.create_application_subnet ? var.application_subnets : null
  public_subnets            = var.create_public_subnet ? var.public_subnets : null
  database_subnets          = var.create_database_subnet ? var.database_subnets : null
  create_public_subnet      = var.create_public_subnet
  create_application_subnet = var.create_application_subnet
  create_database_subnet    = var.create_database_subnet
  environment               = var.environment
  create_endpoints          = var.create_endpoints
  create_vpc_endpoint_sg    = var.create_vpc_endpoint_sg

  public_inbound_nacl_rules  = var.public_inbound_nacl_rules
  public_outbound_nacl_rules = var.public_outbound_nacl_rules

  application_inbound_nacl_rules  = var.application_inbound_nacl_rules
  application_outbound_nacl_rules = var.application_outbound_nacl_rules

  database_inbound_nacl_rules  = var.database_inbound_nacl_rules
  database_outbound_nacl_rules = var.database_outbound_nacl_rules

  interface_vpc_endpoints = var.interface_vpc_endpoints
  gateway_vpc_endpoints   = var.gateway_vpc_endpoints
  security_groups         = var.security_groups

  project_id = var.project_id

  public_cidrs      = var.public_cidrs
  application_cidrs = var.application_cidrs
  database_cidrs    = var.database_cidrs
  owner             = var.owner
  maintainer        = var.maintainer
  provisioner       = var.provisioner
  terraform         = var.terraform
}

module "code_artifact" {
  source = "../../modules/code-artifact"

  environment = var.environment
  owner       = var.owner
  maintainer  = var.maintainer
  provisioner = var.provisioner
  terraform   = var.terraform

  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  customer_master_key_spec           = var.customer_master_key_spec
  deletion_window_in_days            = var.deletion_window_in_days
  kms_description                    = var.kms_description
  enable_key_rotation                = var.enable_key_rotation
  kms_is_enabled                     = var.kms_is_enabled
  key_usage                          = var.key_usage
  kms_multi_region                   = var.kms_multi_region

  ca_domain    = var.ca_domain
  ca_repo_name = var.ca_repo_name

  depends_on = [module.jenkins_vpc]
}

module "efs" {
  source = "../../modules/efs"

  environment = var.environment
  owner       = var.owner
  maintainer  = var.maintainer
  provisioner = var.provisioner
  terraform   = var.terraform

  ca_efs_kms_key_arn = module.code_artifact.ca_efs_kms_key_arn

  vpc_id = module.jenkins_vpc.vpc_id

  creation_token   = var.creation_token
  encrypted        = var.encrypted
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode

  efs_sg_name      = var.efs_sg_name
  sg_ingress_rules = var.sg_ingress_rules
  sg_egress_rules  = var.sg_egress_rules
  app_subnet_ids   = data.aws_subnets.application.ids

  posix_user     = var.posix_user
  root_directory = var.root_directory

  depends_on = [module.code_artifact]
}
