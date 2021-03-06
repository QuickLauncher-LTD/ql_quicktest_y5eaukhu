project = "quicklauncher-975559"

app "quicklauncher-975559" {
  build {
    use "pack" {
       builder     = "paketobuildpacks/builder:base"
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

