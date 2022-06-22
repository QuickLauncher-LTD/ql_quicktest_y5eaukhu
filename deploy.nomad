job quicktest_y5eaukhu {

  datacenters = ["dc-quicklauncher"]

  group "quick-launcher" {
    count = 1
    network {
      mode = "bridge"
      port "http" {
        static = 20542
        to = 8000
      }
    }

    service {
      name = replace("quicktest_y5eaukhu", "_", "-")
      port = "http"

      check {
        type     = "http"
        path     = "/"
        interval = "2s"
        timeout  = "2s"
      }
    }

    task "server" {
      driver = "docker"

     # resources {
     #   cpu    = 600
     #   memory = 700
     # }

      config {
        image = var.image
        ports = ["http"]
      }
    }
  }
}

variable "image" {
    type = string
}

