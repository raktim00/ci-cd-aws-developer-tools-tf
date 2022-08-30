terraform{
    backend "s3" {
        bucket = "raktim-infra-vpc-backend"
        encrypt = true
        region = "ap-south-1"
        key = "terraform_backend/terraform.tfstate"
    }
}