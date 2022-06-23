project = "quicktest_y5eaukhu"

app "quicktest_y5eaukhu" {
  build {
    use "pack" {
       builder     = "heroku/buildpacks:18"
#       buildpacks  = ["heroku/python"]
      disable_entrypoint = true
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

