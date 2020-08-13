terraform {
  required_version = ">= 0.12"
}

provider "google" {
  version = "3.5.0"

  credentials = file("credential/dishout-285810-a65687753e29.json")

  project = "dishout-285810"
  region  = "us-central1"
  zone    = "us-central1-c"
}