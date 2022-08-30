variable "aws_region" {
  type = string
  default = "ap-south-1"
}

variable "codecommit_repository_name" {
  type = string
  default = "infra-vpc-repo"
}

variable "s3_bucket_name" {
    type = string
    default = "raktim-infra-vpc-backend"
}

variable "codebuild_role_name" {
    type = string
    default = "infra-vpc-codebuild-role" 
}

variable "codepipeline_role_name" {
    type = string
    default = "infra-vpc-codepipeline-role"
}

variable "codebuild_policy_name" {
    type = string
    default = "infra-vpc-codebuild-policy" 
}

variable "codepipeline_policy_name" {
    type = string
    default = "infra-vpc-codepipeline-policy"
}

variable "codebuild_plan_project_name" {
    type = string
    default = "infra-vpc-codebuild-project-plan" 
}

variable "codebuild_apply_project_name" {
    type = string
    default = "infra-vpc-codebuild-project-apply" 
}

variable "codepipeline_name" {
    type = string
    default = "infra-vpc-codepipeline" 
}