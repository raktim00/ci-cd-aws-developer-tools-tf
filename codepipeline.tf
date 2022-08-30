resource "aws_codepipeline" "codepipeline" {

    name = var.codepipeline_name
    role_arn = aws_iam_role.codepipeline-role.arn

    artifact_store {
        type="S3"
        location = aws_s3_bucket.s3-bucket-backend.bucket
    }

    stage {
        name = "Source"
        action{
            name = "Source"
            category = "Source"
            owner = "AWS"
            provider = "CodeCommit"
            version = "1"
            output_artifacts = ["infra_vpc_code"]
            configuration = {
                RepositoryName = aws_codecommit_repository.infra-vpc-codecommit-repo.repository_name
                BranchName   = "main"
                OutputArtifactFormat = "CODE_ZIP"
            }
        }
    }

    stage {
        name ="Plan"
        action{
            name = "Build"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["infra_vpc_code"]
            configuration = {
                ProjectName = aws_codebuild_project.codebuild_project_plan_stage.name
            }
        }
    }

    stage {
        name ="Deploy"
        action{
            name = "Deploy"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["infra_vpc_code"]
            configuration = {
                ProjectName = aws_codebuild_project.codebuild_project_apply_stage.name
            }
        }
    }

}