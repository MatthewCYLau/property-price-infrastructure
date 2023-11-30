# Property Price Infrastructure

Google Cloud Platform (GCP) infrastructure for Property Price Engine

The list of repositories are as follow:

- ASP.NET Core web API repository [here](https://github.com/MatthewCYLau/property-price-api)
- React with Vite client repository [here](https://github.com/MatthewCYLau/property-price-client)

## Provision GCP resources

```bash
gcloud auth login
gcloud auth application-default login
terraform init # initialises Terraform
terraform apply # deploys GCP stack
terraform destroy # destroys GCP stack
```
