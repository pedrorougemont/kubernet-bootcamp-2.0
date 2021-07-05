/*provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}*/
terraform {
    required_providers {
        digitalocean = {
            source = "digitalocean/digitalocean"
            version = "1.22.2"
        }
    }
}

provider "digitalocean" {
    token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "labs" {
    name    = var.kubernetes_name
    region  = "nyc1"
    version = "1.21.2-do.2"

    node_pool {
        name        = "worker-pool"
        size        = "s-2vcpu-2gb"
        node_count  = 3
    }
}

resource "local_file" "labs_config" {
    content     = digitalocean_kubernetes_cluster.labs
    filename    = "kube_config.yaml"
}

variable "do_token" {}
variable "kubernetes_name" {}