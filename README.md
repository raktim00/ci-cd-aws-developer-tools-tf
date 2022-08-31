# Running Terraform via AWS Developer Tools — Complete CI/CD Guide

## Blog Link: https://link.medium.com/IVTczJGRUsb

### Problem Statement:

- Create one repository on CodeCommit to store the terraform code. Connect CodeCommit with your local computer for continuous development of the terraform code.
- Create two CodeBuild projects — first to run the terraform plan & next is to apply the changes.
- Create one CodePipeline which will fetch the code from CodeCommit & can run CodeBuild projects to deploy that Terraform code. So that we can provision other resources.
- Create necessary IAM roles & permissions. Also store the logs of CodeBuild process in CloudWatch Logs.

![architectural diagram](https://miro.medium.com/max/1400/1*nVjnELWrsY-KeoTT61QDNw.png)
