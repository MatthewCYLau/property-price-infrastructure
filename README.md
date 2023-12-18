# Property Price Infrastructure

Google Cloud Platform (GCP) infrastructure for Property Price Engine

![provision infrastructure workflow](https://github.com/MatthewCYLau/property-price-infrastructure/actions/workflows/provision-infrastructure.yml/badge.svg)

The list of repositories are as follow:

- ASP.NET Core web API repository [here](https://github.com/MatthewCYLau/property-price-api)
- React with Vite client repository [here](https://github.com/MatthewCYLau/property-price-client)
- Google Cloud Platform (GCP) with Terraform infrastructure repository [here](https://github.com/MatthewCYLau/property-price-infrastructure)

## Provision GCP resources

```bash
gcloud auth login
gcloud auth application-default login
cd deploy/app
terraform init # initialises Terraform
terraform apply # deploys GCP stack
terraform destroy # destroys GCP stack
```
