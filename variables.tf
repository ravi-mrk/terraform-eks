variable "cluster_name" {}
variable "instance_type" {}
variable "desired_capacity" {}
variable "max_capacity" {}
variable "min_capacity" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
