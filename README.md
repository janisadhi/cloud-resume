# Cloud Resume Challenge

This project is part of the **Cloud Resume Challenge**, showcasing my skills in cloud technologies, DevOps practices, and full-stack development. The challenge involves building a dynamic resume hosted on the cloud, integrating various AWS services, and implementing CI/CD automation.

## 🚀 Overview

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** AWS Lambda (Python), DynamoDB
- **Infrastructure as Code:** Terraform
- **CI/CD:** GitHub Actions
- **Hosting & Security:** AWS S3, CloudFront, Cloudflare

## 📌 Features

- A resume webpage hosted on AWS S3 and accessible via [janisadhi.me](https://janisadhi.me).
- A visitor counter using AWS Lambda, API Gateway, and DynamoDB.
- HTTPS security via AWS CloudFront and Cloudflare.
- CI/CD pipeline for both frontend and backend using GitHub Actions.
- Infrastructure provisioned and managed with Terraform.

## 🛠️ Setup and Deployment

### Prerequisites
Ensure you have the following installed:
- Terraform
- AWS CLI
- GitHub Actions configured
- Node.js (for frontend development)
- Python (for AWS Lambda function)

### Deployment Steps
1. **Clone the repository**
   ```sh
   git clone https://github.com/janisadhi/Cloud-Resume-Challenge.git
   cd cloud-resume
   ```
2. **Setup Frontend**
   - Navigate to the frontend directory and modify `index.html` as needed.
   - Create a s3 bucket from  AWS console

3. **Deploy Backend with Terraform**
   ```sh
   cd .terraform
   terraform init
   terraform apply
   ```



5. **Enable CI/CD**
   - Ensure GitHub Actions workflows are correctly set up.
   - Add your s3 bucknet name in `FrontendCICD.yaml file`
   - Add AWS secrets and API key to secret
   - Push changes to trigger automated deployment.

## 🔥 DevOps Practices Implemented
As a **DevOps Engineer**, I have implemented:
- **Infrastructure as Code (IaC)** using Terraform for reproducibility.
- **Automated deployments** with GitHub Actions for a streamlined workflow.
- **Security best practices**, including IAM roles and HTTPS.
- **Monitoring & Logging** using AWS CloudWatch.


## 🤝 Connect with Me
If you have any questions, feel free to reach out!
- Portfolio: [Janis Portfolio](https://janisadhi.me)
- LinkedIn: [linkedin.com/in/janisadhi](https://linkedin.com/in/janisadhi)
- GitHub: [janisadhi](https://github.com/janisadhi)

---

**Janis Adhikari**  
*DevOps Engineer | Frontend Developer | Cloud Enthusiast*

