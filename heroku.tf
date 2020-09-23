#Set the latest heroku provider. Check the current version here:
#https://github.com/hashicorp/terraform-provider-heroku/releases
provider "heroku" {
  version = "~> 2.5"
  api_key = "<heroku api key>"
  email = "<heroku account email>"
}

#This is a terraform variable, contains the description of the deloyment app
variable "futar_api" {
  description = "Futar api, backend for futar"
}

#This is a heroku resource. This represents the app, contains the deployment region and app name
resource "heroku_app" "futarapi" {
  name = var.futar_api
  region = "us"
  config_vars = {
    APP_DEBUG = true
    APP_NAME = var.futar_api
  }
}

#Setting up a postgres database addon for the app
resource "heroku_addon" "database" {
  app  = heroku_app.futarapi.name
  plan = "heroku-postgresql:hobby-basic"
}

#attaching database to api, this creates the relevant env var
resource "heroku_addon_attachment" "database" {
  app_id  = heroku_app.futarapi.id
  addon_id = heroku_addon.database.id
}

# Setting up build options resource for the heroku app resource. We will use the default php build pack, and the source code for the api
resource "heroku_build" "futarapi" {
  app = heroku_app.futarapi.name

  source = {
    url = "https://github.com/garel/futarapi/archive/0.0.2.tar.gz"
    version = "0.0.2"
  }
}

# We start a dyno for the app
resource "heroku_formation" "futarapi" {
  app        = heroku_app.futarapi.name
  type       = "web"
  quantity   = 1
  size       = "free"
  depends_on = [heroku_build.futarapi]
}

output "futarapi_app_url" {
  value = "https://${heroku_app.futarapi.name}.herokuapp.com"
}