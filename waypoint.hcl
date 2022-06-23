project = "quicktest_y5eaukhu"

app "quicktest_y5eaukhu" {
  build {
    use "pack" {
      builder = ""
#       builder     = "paketobuildpacks/builder:base"
#       buildpacks  = ["heroku/python"]
#       disable_entrypoint = false
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

