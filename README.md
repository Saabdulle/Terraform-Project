# Project README

## Overview

This project involves setting up a Virtual Private Cloud (VPC) in the AWS cloud environment, deploying three services (Lighting, Heating, and Status) that interact with a DynamoDB table, and creating an Application Load Balancer for these services. The infrastructure is defined using Terraform, and it adheres to the specified requirements.

## VPC Setup

1. **Region**: The VPC is created in the specified region.

2. **Availability Zones (AZs)**: The VPC spans three Availability Zones.

3. **Subnets**:
   - Public subnets: One in each AZ.
   - Private subnets: One in each AZ.

4. **Internet Gateway (IGW)**: An Internet Gateway is created to allow external communication.

5. **Route Table**: A route table is configured to handle local traffic and route other traffic to the Internet Gateway.

## Security Groups

Security groups have been set up for the subnets to allow ingress and egress for HTTP and HTTPS requests on the correct ports from all external sources. Additionally, SSH access is configured for your IP address.

## Lighting Service

1. The Lighting service is hosted and configured to be accessible externally.

2. The service interacts with a DynamoDB table in the network.

3. IAM User: A user with policies to access DynamoDB, CLI access, and credentials provided in environment files.

4. IAM Role for Service: Another IAM user for the Lighting service with a policy allowing it to interact with DynamoDB.

## Heating Service

1. The Heating service is hosted and configured to be accessible externally.

2. The service interacts with a DynamoDB table in the network.

## Status Service

1. The Status service is hosted and configured to be accessible externally.

2. The service interacts with other services to aggregate information on one endpoint.

## Load Balancer

An Application Load Balancer is created with path-based routing to connect to each service, avoiding the need for three separate load balancers.

## Autoscaling

Autoscaling groups are set up for each service with specified configurations in the `tfvars` file. This includes minimum, maximum, and desired instances, instance type, and AMI images.

## `terraform.tfvars` Configuration

Ensure your `terraform.tfvars` file contains the following information:

```hcl
public_subnets     = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
private_subnets    = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
cidr_block         = "10.0.0.0/16"
instance_type      = "t2.micro"
key_name           = "key_name"
server_count       = 1
table_names        = ["Lights-Table", "Heating-Table"]
table_tags         = ["Lights_Table", "Heating_Table"]
server_names       = ["Lights", "Heating", "Status"]
min_size           = 1
max_size           = 5
desired_size       = 2
ami_images         = ["ami", "ami", "ami"]  # Replace with actual AMI IDs
```

Replace placeholder values in the `tfvars` file with your actual configurations.

## Execution

1. Ensure that Terraform is installed on your local machine.

2. Run the following commands in the project directory:

    - ```terraform init```
    - ```terraform plan ```
    - ```terraform apply```


3. Terraform will prompt for confirmation. Type "yes" to proceed with the infrastructure deployment.

4. Wait for Terraform to complete the deployment.

5. To destroy the infrastructure and resources created by Terraform:

    - ```terraform destroy```

## Notes

- Make sure to handle sensitive information securely, especially IAM credentials and environment files.
- Avoid committing sensitive information to version control systems.


Congratulations! Your AWS infrastructure for the project is now set up.
