project = "quicktest_y5e-aukhu"

app "quicktest_y5e-aukhu" {
  build {
    use "pack" {
       builder     = "heroku/buildpacks:20"
#       buildpacks  = ["heroku/python"]
#       disable_entrypoint = true
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

