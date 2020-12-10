# Azure_Terraform_Demos

A set of demos (hopefully) to provide a basic overview of how to deploy infrastructure as code in Azure using Terraform.

Prerequisites:

- Microsoft Azure account with subscription set up.

- Azure CLI installed - https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

- Terraform installed and added to system path - https://learn.hashicorp.com/tutorials/terraform/install-cli

# Steps:

- Log in to Azure using the Azure CLI, either via: 

  - `az login` 

  - OR 

  - `az login -u <username> -p <password>`

- In the folder of choice, ensure regions match where appropriate and tweak the resources and versions to suit.

- Initialize the directory: `terraform init`

- As good practice, validate the configuration files to ensure there are no syntactical errors, etc: `terraform validate`

- Note - This won't be necessary for this repo, but it's good practice nonetheless to ensure readability of your config files: `terraform fmt`

- View the plan for your infrastructure deployment and verify it matches expectations: `terraform plan`

- Apply after any issues with the plan are resolved: `terraform apply` (type `yes` to approve, if you're confident and **NOT IN A PRODUCTION ENVIRONMENT** add the flag `--auto-approve` after apply)

- Once the CLI indicates the resources are created, access Azure to view and use the applications where appropriate.
