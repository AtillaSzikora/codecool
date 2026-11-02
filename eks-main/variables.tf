variable "project_name" {
  description = "Name used to identify resources created for this project"
  type        = string
  default     = "kalman-eks-main"
}

variable "region" {
  description = "AWS region where the VPC will be created"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "IPv4 CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Three availability zones for the public and private subnet pairs"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

  validation {
    condition     = length(var.availability_zones) == 3 && length(distinct(var.availability_zones)) == 3
    error_message = "Provide exactly three unique availability zones."
  }
}

variable "public_subnet_cidrs" {
  description = "IPv4 CIDR blocks for the public subnets, in availability-zone order"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  validation {
    condition     = length(var.public_subnet_cidrs) == 3
    error_message = "Provide exactly three public subnet CIDR blocks."
  }
}

variable "private_subnet_cidrs" {
  description = "IPv4 CIDR blocks for the private subnets, in availability-zone order"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

  validation {
    condition     = length(var.private_subnet_cidrs) == 3
    error_message = "Provide exactly three private subnet CIDR blocks."
  }
}

variable "tags" {
  description = "Tags applied to all project resources"
  type        = map(string)
  default = {
    Environment = "development"
    ManagedBy   = "terraform"
    Owner       = "Kalman"
  }
}
