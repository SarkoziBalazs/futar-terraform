terraform {
  required_providers {
    heroku = {
      source = "heroku/heroku"
    }
    netlify = {
      source = "terraform-providers/netlify"
    }
  }
  required_version = ">= 0.13"
}
