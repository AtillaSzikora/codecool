provider "aws" {
    region = var.region
    profile = "devops-csk2"
    
    default_tags {
        tags = var.tags
    }
}
