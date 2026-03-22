# GCP-Infrastructure-Dataproc-Automation
Markdown# GCP Infrastructure & Dataproc Automation Guide

This repository contains Terraform configurations for a VPC network and a summary of Dataproc cluster management based on Google Cloud training modules.

---

## Part 1: Terraform Infrastructure Setup

Follow these steps in **Google Cloud Shell** to deploy the network and VM instances.

### 1. Initialize Environment
```bash
# Verify Terraform version
terraform --version

# Create and enter directory
mkdir tfinfra && cd tfinfra
2. Initialize TerraformAfter creating provider.tf, run:Bashterraform init
3. Deploy ResourcesBash# Rewrite files to canonical format
terraform fmt

# Review the execution plan (should show 4 resources to add)
terraform plan

# Apply the configuration
terraform apply
# Type 'yes' when prompted
4. Verify ConnectivityOnce the apply is complete, verify the internal connection between mynet-vm-1 and mynet-vm-2:Go to Compute Engine > VM Instances.Note the Internal IP of mynet-vm-2.Click SSH on mynet-vm-1.Run the ping test:Bashping -c 3 <INTERNAL_IP_OF_VM_2>
Part 2: Dataproc Cluster Management (Manual Workflow)Based on the Dataproc transcript, follow these steps to run a Spark job.1. Cluster CreationNavigation: Big Data > Dataproc > Clusters.Name: example-clusterNodes: 1 Master, 2 Workers (Standard Mode).Machine Type: n1-standard-4 (4 vCPUs).2. Scaling the ClusterTo add more compute power while the cluster is running:Click on the cluster name > Configuration tab.Click Edit.Change Worker nodes from 2 to 3.Click Save.3. Submitting a Spark JobNavigate to Jobs > Submit Job and use these parameters:FieldValueJob TypeSparkMain classorg.apache.spark.examples.SparkPiJar filesfile:///usr/lib/spark/examples/jars/spark-examples.jarArguments10004. CleanupTo avoid recurring charges, delete the resources once the job status shows Succeeded:Bash# If using gcloud CLI:
gcloud dataproc clusters delete example-cluster --region=[YOUR_REGION]
Part 3: Teardown TerraformTo remove the VPC, Firewall, and VM instances created in Part 1:Bashterraform destroy
# Type 'yes' when prompted

---

### Why this matters
Including the `ping` and `fmt` commands makes this repo a "Golden Path" for anyone trying to replicate your work. It ensures the code is clean, the infrastructure is verified, and the Big Data jobs are documented.

Would you like me to create a shell script (`setup.sh`) that automates the file crea
