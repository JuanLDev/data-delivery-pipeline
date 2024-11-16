#!/bin/bash

# Define the project root directory
PROJECT_ROOT="data-delivery-pipeline"

# Create the main project structure
echo "Creating project structure..."
mkdir -p $PROJECT_ROOT/{terraform,modules/{s3-bucket,lambda-function,iam-roles},scripts,config,data}

# Create placeholder files for Terraform
touch $PROJECT_ROOT/terraform/{provider.tf,variables.tf,main.tf,outputs.tf}
touch $PROJECT_ROOT/terraform/.gitignore

# Create module files for S3, Lambda, and IAM roles
touch $PROJECT_ROOT/modules/s3-bucket/{main.tf,variables.tf,outputs.tf}
touch $PROJECT_ROOT/modules/lambda-function/{main.tf,variables.tf,outputs.tf}
touch $PROJECT_ROOT/modules/iam-roles/{main.tf,variables.tf,outputs.tf}

# Create initial Python scripts
touch $PROJECT_ROOT/scripts/{data_fetch.py,data_clean.py,data_analysis.py,deploy.sh}

# Create configuration file for Alpha Vantage API
touch $PROJECT_ROOT/config/alpha_vantage_config.json

# Create a README file and .gitignore
touch $PROJECT_ROOT/README.md
touch $PROJECT_ROOT/.gitignore

# Add content to .gitignore
echo "__pycache__/
*.pyc
*.log
.terraform/
terraform.tfstate*
.venv/
.env
" > $PROJECT_ROOT/.gitignore

# Create data directory for storing raw and processed files
mkdir -p $PROJECT_ROOT/data/{raw,cleaned,processed}

echo "Project structure created successfully!"

# Print the created structure
echo "Directory structure:"
tree $PROJECT_ROOT
