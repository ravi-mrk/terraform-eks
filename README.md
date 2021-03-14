# terraform-eks
This repository contains terraform code needed for creating an EKS cluster in an already existing VPC in AWS. You will need to give the subnet IDs and the VPC ID as inputs for running this code.


**Follow below steps for creating EKS cluster in an existing VPC**

1. Modify all variables as per your cluster details in test.tfvars files
2. make any changes to the iam-policy.json file for changing the IAM policies being created with this code
3. Run below terraform commands:
    ```
    terraform fmt ***(Run this command for formatting any changes to the terraform files.)***
    terraform init
    terraform plan -var-file=test.tfvars
    terraform apply -var-file=test.tfvars
    ```
4. Input `yes` when prompted on terraform apply command
5. EKS cluster will be created in the selected VPC and with given subnets.
6. To access the cluster with kubectl commands, use below example command:
    ```
    KUBECONFIG=./kubeconfig_eks-opsfleet-test-new kubectl get nodes
    
    where `kubeconfig_eks-opsfleet-test-new` is the kubernetes config file created for the EKS cluster.
    ```   
7. After the cluster is successfully created, you can access S3 buckets from the pods in EKS by either mounting those buckets to the pods in RWM mode or as a NFS like filesystem.
8. Below is an example showing how to mount s3 as storage filesystem to a pod in this newly created EKS cluster:
   ```
   KUBECONFIG=./kubeconfig_eks-opsfleet-test-new kubectl apply -f s3fs.yaml
   
   ** NOTE: Change values of the S3_BUCKET, S3_REGION, AWSACCESSKEYID, AWSSECRETACCESSKEY
   in the s3fs.yaml file for accessing the s3 storage from the pod **
   
   ```
