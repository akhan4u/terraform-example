# Design Terraform Classic VPC Configuration

## Explanation

Write a Terraform template with an example of a standard VPC deployment and testing public and private EC2 instances.

## What to do?

#### VPC - Deploys the following resources:

* VPC
* 2 Public Subnets (External 1 and External 2)
* 2 Private Subnets (Internal 1 and Internal 2)
* Internet Gateway (Default)
* 2 Routing Tables (Public and Private)
* 1 Security Group (SSH)

> NOTE: There are no NACLs configured. For this example the defaults will be used, allowing all incoming and outgoing traffic. The Security Group will be applied to both instances for SSH access.

#### EC2 - Deploys the following resources:

* 1 EC2 Instance with external access (t2.micro, AWS AMI, Subnet External 1)
* 1 EC2 Instance without external access (t2.micro, AWS AMI, Subnet Internal 1)

## Points of Consideration

* First, the instances are launched using a keypair called "Default", that has been generated before this deployment. If there is no such keypair in your account you won't be able to log in into the instances.
* Second, the AMI id has been hardcoded to keep consistency between EC2 instances over time. This can be dynamically obtained using the `aws_ami` data resource.
* As for variables in this example, note that is not best practice to hardcode any variable, especially those that are outside our control (AMI case). Variables should be defined separately and used accordingly in the resources.

## Expected Results

Once the code is completed [please fork and raise the PR](https://jarv.is/notes/how-to-pull-request-fork-github/) with this repository.

Possibly with a `README.md` file explaining how to implement your solution.

## 🛠 Skills
Terraform, AWS, DevOps

## Authors

- [@akhan4u](https://www.github.com/akhan4u)
