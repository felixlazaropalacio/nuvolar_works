# Nuvolar Works API
A dummy repository for a Nuvolar Works technical test. The system has been designed to be deployed with Terraform in a GCP (Google Cloud Platform) project.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Configuration](#configuration)
- [Usage](#usage)

## Prerequisites

Prerequisites to use this Terraform modules.

### Google Cloud Platform

* Install [gcloud CLI](https://cloud.google.com/sdk/docs/install?hl=es-419) locally.
* Create a GCP project and link a billing account.
* Create a service account within deploy the infrastructure using Terraform and grant it Project Owner role (roles/owner)
* Create a GCS bucket for Terraform state.
* Create a JSON key file for the Terraform service account created and download it in the folder ./terraform/credentials

### Terraform

* Install [Terraform](https://developer.hashicorp.com/terraform/install) locally.

### Kubectl

* Install [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) locally.

## Configuration

Before using this Terraform code, you must configure a list of variables that depends on your project:

- Update ./terraform/backends/pro-backend.tf file with the credential file name and the GCS bucket name for Terraform state:

```
credentials = "./credentials/gcp_pro_credentials.json"
bucket  = "nuvolar-works-pro-tfstate"
prefix = "terraform/state"

```
- Update ./terraform/env/vars-pro.tfvars file with the GCP project name, the default region and the credential file name.

```
### PROJECT SETTINGS ###
project          = "nuvolar-works-project"
region           = "europe-west1"
credentials-file = "credentials/gcp_pro_credentials.json"

```

- Update ./k8s/ingress/api-ingress.yaml file changing the host `nuvolar.works.com` for valid domain configured in a DNS.

```
spec:
  defaultBackend:
    service:
      name: api-gateway-service
      port:
        number: 8080
  rules:
  - host: nuvolar.works.com
    http:
      paths:
      - backend:
          service:
            name: api-gateway-service
            port:
              number: 8080
        path: /order
        pathType: Prefix
  tls:
  - hosts:
    - nuvolar.works.com
    secretName: nuvolar-ssl-cert-secret

```

- Update ./k8s/secret/nuvolar-ssl-cert-secret.yaml file filling `tls.crt` and `tls.key` fileds according a SSL Certificate valid for your domain.

```
apiVersion: v1
data:
  tls.crt: 
  tls.key: 
kind: Secret
metadata:
  name: nuvolar-ssl-cert-secret
  namespace: nuvolar
type: kubernetes.io/tls

```

- Update ./k8s/deployments/api-gateway.yaml file changing the enviroment variable `ORDER_SERVICE_URL` value to the url where the order-service microservice will be exposed.

```
spec:
      containers:
      - env:
        - name: ORDER_SERVICE_URL
          value: XXX
        image: nuvolar/api-gateway:latest
        imagePullPolicy: Always
        livenessProbe:
          httpGet:
            path: /order
            port: 8080
        name: nuvolar-api-gateway
        ports:
        - containerPort: 8080

```

- Update ./k8s/deployments/order-service.yaml file changing the enviroment variable `CUSTOMER_SERVICE_URL` value to the url where the customer-service microservice will be exposed.

```
spec:
      containers:
      - env:
        - name: CUSTOMER_SERVICE_URL
          value: XXX
        image: nuvolar/order-service:latest
        imagePullPolicy: Always
        name: nuvolar-order-service
        ports:
        - containerPort: 8080

```

## Usage

This repository is composed by two folders, `k8s` and `terraform`. 

In the `terraform` folder, there are different files to deploy into GCP the infrastructure needed for an API consists on three Spring Boot microservices. Also, you are able to deploy the same infrastructure in different projects for different enviromments (PRO, DEV, TEST, etc.) in a few steps. 

In the `k8s` folder, there are Kubernetes manifests to deploy the microservices and components needed into GKE cluster deployed by Terraform.

1. Run `git clone felixlazaropalacio/nuvolar_works && cd nuvolar_works/terraform`

2. Run `gcloud auth login --impersonate-service-account=$TERRAFORM_SA  ` setting $TERRAFORM_SA to service account created for Terraform.

3. Run `terraform init -backend-config="backends/$BACKEND_FILE" -reconfigure` setting $BACKEND_FILE to the backend file name of the project where you will deploy the infrastructure (for example: pro-backend.tf for a production enviroment project).

4. Run `terraform apply -var-file="./env/$VARS_FILE"` setting $VARS_FILE to the Terraform variables file name of the project where you will deploy the infrastructure (for example: vars-pro.tfvars for a production enviroment project).

5. Once the infrastructure has been deployed, connect to the cluster running `gcloud container clusters get-credentials $CLUSTER_NAME --region europe-west1 --project $PROJECT_NAME`.

6. Then, deploy Kubernetes objects running `kubectl apply -f "../k8s" -R`

