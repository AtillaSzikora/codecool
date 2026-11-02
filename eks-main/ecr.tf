resource "aws_ecr_repository" "service_a" {
  name                 = "${var.project_name}/service-a"
  image_tag_mutability = "MUTABLE"
  force_delete         = false

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-service-a"
  })
}

resource "aws_ecr_repository" "service_b" {
  name                 = "${var.project_name}/service-b"
  image_tag_mutability = "MUTABLE"
  force_delete         = false

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-service-b"
  })
}
