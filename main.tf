terraform {
  required_providers {
    google = {
      version = "5.35.0"
    }
  }
  required_version = ">= 1.8"
}

variable "project_id" {
  type        = string
  description = "GCP project ID."
  nullable    = false
}

variable "region" {
  type        = string
  description = "GCP project region."
  nullable    = false
  default     = "us-west1"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_container_cluster" "my_cluster" {
  name     = "main"
  location = "us-west1-a"
}

output "node_pool_name" {
  value = data.google_container_cluster.my_cluster.node_pool[0].id
}
