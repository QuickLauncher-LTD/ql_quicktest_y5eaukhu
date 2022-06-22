project = "quicktest_y5eaukhu"

app "quicktest_y5eaukhu" {
  build {
    use "pack" {
      builder     = "heroku/buildpacks:20"
      buildpacks  = ["heroku/python/3.9.13"]
    }
    registry {
      use "docker" {
        image = var.ecr_repo
        tag   = var.image_tag
      }
    }
  }
  deploy {
    use "docker" {
    }
  }
}

variable "image_tag" {
  type    = string
}

variable "ecr_repo" {
  type    = string
}

