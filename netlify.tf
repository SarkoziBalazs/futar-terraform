# Configure the Netlify Provider
provider "netlify" {
  token    = "<netlify access token>"
}

# Create a new deploy key for this specific website
resource "netlify_deploy_key" "key" {}

# Define your site
resource "netlify_site" "main" {
  name = "futar-terraform"

  repo {
    command       = "npm run generate"
    deploy_key_id = netlify_deploy_key.key.id
    dir           = "/dist"
    provider      = "github"
    repo_path     = "sarkozibalazs/futar"
    repo_branch   = "master"
  }
}
