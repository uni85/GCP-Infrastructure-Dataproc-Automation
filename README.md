# Repository Structure

This repository contains the project files organized as follows:

- **/terraform**: Contains all the Terraform configuration files used for infrastructure provisioning.
- **/dataproc**: Contains scripts and configurations specific to Google Cloud Dataproc.
- **README.md**: This file provides an overview of the project.


# Terraform Infrastructure

The Terraform files in the `/terraform` directory allow for automated provisioning of resources in Google Cloud. The key files include:

- **main.tf**: The main configuration file that defines the cloud resources.
- **variables.tf**: Contains variables to parameterize configurations.
- **outputs.tf**: Specifies the outputs of the Terraform configuration.

To deploy the infrastructure, run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

Ensure that you have configured your Google Cloud credentials properly before running these commands.


# Dataproc Guide

This section provides an overview of managing Dataproc clusters.

## Creating a Cluster
To create a Dataproc cluster:

```bash
gcloud dataproc clusters create [CLUSTER_NAME] --region=[REGION]
```

## Submitting a Job
To submit a job to the Dataproc cluster:

```bash
gcloud dataproc jobs submit [JOB_TYPE] --cluster=[CLUSTER_NAME] --region=[REGION]
```

## Deleting a Cluster
To delete a Dataproc cluster:

```bash
gcloud dataproc clusters delete [CLUSTER_NAME] --region=[REGION] --quiet
```
