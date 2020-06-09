## Terraform module helm-deploy

This terraform module will help you deploy the helm charts on local.

- [Requirements](#Requirements)

- [Before you begin](#before-you-begin)

- [Usage](#usage)

- [Variables](#variables)

- [Custom Values](#custom-variable-deployment)

  

## Requirements

Terraform >= 0.11.7

Kubernetes  >=  v1.14.8

Tiller >= v2.11.0

## Before you begin

1. Make sure that you have `kubectl` installed and you have configured your `~/.kube/config` 
2. Make sure you have tiller installed on your  kubernetes cluster
3. Make sure that terraform also installed and follows [Requirements](#Requirements)

## Local Chart usage

First you will need to create your own helm chart [link](https://docs.bitnami.com/kubernetes/how-to/create-your-first-helm-chart/). If you would like to quickly create helm chart then run

Run following command to create `charts` folder and local chart `example`

```
mkdir charts && helm create charts/example
```

After you have local chart you should be able to create following file to deploy your charts `main.tf`

``` 
module "local_helm_deployment" {
  source                 = "fuchicorp/chart/helm"
  deployment_name        = "example-deployment"
  deployment_environment = "dev"
  deployment_endpoint    = "example.domain.com"
  deployment_path        = "example"
}
```

After you have your helm chart you can go ahead and do modification inside `values.yaml` 

```
ingress:
  enabled: true
  annotations: 
    kubernetes.io/ingress.class: nginx
  hosts:
    - host: ${deployment_endpoint}
```
NOTE: `deployment_endpoint` will be replaced  to `example.domain.com`


## Remote Chart usage

For remote charts you need to create `main.tf` file only

```
module "remote_chart_deploy" {
  source                 = "fuchicorp/chart/helm"
  deployment_name        = "example-deployment"
  deployment_environment = "dev"
  deployment_endpoint    = "example.domain.com"
  deployment_path        = "stable/wordpress"
  release_version        = "9.0.3"
  remote_chart           = "true"
}
```
## Variables

For more info, please see the [variables file](variables.tf).

| Variable               | Description                         | Default                                               | Type |
| :--------------------- | :---------------------------------- | :---------------------------------------------------: | :--------------------: |
| `deployment_name` | The name of the deployement for helm release | `(Required)` | `string` |
| `deployment_environment` | Name of the namespace | `(Required)` | `string` |
| `deployment_endpoint` | Ingress endpoint `example.fuchicorp.com` | `(Required)` | `domain/string` |
| `deployment_path` | path for helm chart on local | `(Required)` | `string` |
| `template_custom_vars` | Template custom veriables you can modify variables by parsting the `template_custom_vars` | (Optional) | `map` |
| `env_vars` | Environment veriable for the containers takes map | `(Optional)` | `map` |
| `timeout` | If you would like to increase the timeout | `(Optional)` | `number` |
| `recreate_pods` | On update performs pods restart for the resource if applicable. | `(Optional)` | `bool` |
| `release_version` | Specify the exact chart version to install. | `(Required)` | `string` |
| `remote_chart` | Used for only remote or local charts | `(Optional)` | `bool` |





## Custom variable deployment 

```
module "local_helm_deployment" {
  source                 = "fuchicorp/chart/helm"
  deployment_name        = "example-deployment"
  deployment_environment = "dev"
  deployment_endpoint    = "example.domain.com"
  deployment_path        = "example"

  template_custom_vars = {
    deployment_image = "nginx"
  }
}
```

Every key and value you define inside `template_custom_vars` will used for your `values.yaml` in this case 

NOTE: `deployment_image` value will replace inside file to `nginx` 

```
  repository: ${deployment_image}
```

Output file will be: 

```
  repository: nginx
```



Created for FuchiCorp developed by FuchiCorp DevOps team enjoy using it
