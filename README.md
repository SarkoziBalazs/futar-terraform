#### Terraform deployment for futar microservice demo

This repo provides the terraform scripts that are able to deploy the futar and futar api applications to netlify and heroku respectively. 

#### Usage

Install [Terraform](https://www.terraform.io/)

Init project from commandline

```terraform init```

Plan deployment

```terraform plan```

Review execution plan and deploy infrastructure

```terraform apply```

#### More information

[Terraform](https://www.terraform.io/) docs, tutorials, and samples

[How to use heroku with terraform](https://devcenter.heroku.com/articles/using-terraform-with-heroku)

[Netlify terraform provider](https://github.com/terraform-providers/terraform-provider-netlify) Note: this is quite a useful source of information, since there is very little sample and documention is available about how to use Netlify with terraform. 