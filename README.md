# data-delivery-pipeline

---

## **Project Overview**

The **Data Delivery Pipeline** project demonstrates a scalable and automated pipeline for ingesting, cleaning, and delivering data to S3 buckets. This project showcases the use of **AWS** services to process and manage data efficiently, leveraging Terraform for infrastructure as code and GitHub Actions for continuous integration.

---

## **Features**

1. **Automated Data Ingestion:**

   - Upload raw data to an S3 bucket.
   - Automatically trigger a Lambda function for data cleaning.

2. **Data Cleaning:**

   - A Python-based Lambda function processes and cleans the data.

3. **Data Delivery:**

   - Cleaned data is stored in a separate S3 bucket.

4. **Continuous Integration and Deployment (CI/CD):**

   - Automated Terraform deployment using GitHub Actions.

5. **Scalability and Maintainability:**
   - Modular infrastructure for S3, IAM roles, and Lambda functions using Terraform.

---

## **Tech Stack**

- **AWS Services:**
  - **S3**: Storage for raw and cleaned data.
  - **Lambda**: For data cleaning and transformation.
  - **EventBridge**: Triggers Lambda upon data upload.
  - **IAM**: Permissions for secure resource access.
- **Infrastructure as Code:**
  - **Terraform**: Provisioning AWS resources.
- **CI/CD:**
  - **GitHub Actions**: Automating Terraform deployments.
- **Python Libraries:**
  - **pandas**, **numpy**, **boto3**: For data processing and AWS interaction.
- **CodeBuild**: For advanced pipeline management and deployments.
