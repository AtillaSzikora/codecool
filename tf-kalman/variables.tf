variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "availability_zones" {
  description = "List of availability zones in the specified region"
  type = list(string)
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

  validation {
    condition = contains(["eu-central-1a", "eu-central-1b", "eu-central-1c"], var.availability_zones)
    error_message = "Availability zones must be: ['eu-central-1a', 'eu-central-1b', 'eu-central-1c']"
  }
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "The CIDR block list for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "The CIDR block list for the private subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Example AMI ID for Amazon Linux 2 in eu-central-1
}

variable "instance_type" {
  description = "The instance type to use"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "The number of instances to deploy"
  type        = number
  default     = 3
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "development"
    Owner       = "devops"
  }
}
