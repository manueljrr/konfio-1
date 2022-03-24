module "eks_w_nodegroups_and_fargate" {
  source = "https://<core_artifact_source_url>.zip"
  //NETWORK
  subnet_ids         = ["subnet-routable-id1", "subnet-routable-id2"]
  security_group_ids = ["sg-id1"]

  //EKS  
  iam_role_arn           = module.eks_cluster_role.role_arn 
  version_eks            = "1.21"
  cluster_create_timeout = "60m"
  cluster_delete_timeout = "30m"

  //EKS Fargate Profile
  fargate_profiles = {
    "profile1" = {
      fargate_profile_name   = "fargate_name_example"
      pod_execution_role_arn = module.eks_fargate_role.role_arn 
      subnet_ids             = ["subnet-non-routable-id1", "subnet-non-routable-id2"]
      namespace              = "test001"
    }

    "profile2" = {
      fargate_profile_name   = "cibd1airfgttest01gene002"
      pod_execution_role_arn = module.eks_fargate_role.role_arn 
      subnet_ids             = ["subnet-non-routable-id3", "subnet-non-routable-id4"]
      namespace              = "test002"

    }
  }
  //Node Group
  node_groups = {
    "node1" = {
      ami_type           = "AL2_x86_64_GPU"
      disk_size          = 30
      instance_types     = "t3.small"
      ec2_ssh_key        = "eks_key_iac"
      desired_size       = 1
      max_size           = 2
      min_size           = 1
      node_role_arn      = module.eks_node_role.role_arn 
      sequence           = "001"
      security_group_ids = ["sg-id1"]
      volume_type        = "gp2"
      image_id           = "ami-063ccf9a10635cf6f"

    }
    "node2" = {
      ami_type           = "AL2_x86_64_GPU"
      disk_size          = 30
      capacity_type      = "SPOT"
      instance_types     = "t3.small"
      ec2_ssh_key        = "eks_key_iac"
      desired_size       = 1
      max_size           = 2
      min_size           = 1
      node_role_arn      = module.eks_node_role.role_arn 
      subnet_ids         = ["subnet-non-routable-id1", "subnet-non-routable-id2"]
      sequence           = "002"
      security_group_ids = ["sg-id1"]
      volume_type        = "gp2"
      image_id           = "ami-063ccf9a10635cf6f"

    }
  }
  //TAGS
  tags = {
    cost_center   = "CC-CIB"
    product       = "INFRASTRUCTURE SERVICES"
    cia           = "BLL"
    channel       = "OMNICHANNEL"
    description   = "PLATFORM RESOURCES TEST IAC"
    tracking_code = "CIB"
    Testing       = "tag testing"
  }

  // NAMING
  naming = {
    entity      = "abd"
    environment = "er"
    geo_region  = "air"
    app_name    = "test01"
    function    = "gene"
    sequence    = "001"
  }

}
