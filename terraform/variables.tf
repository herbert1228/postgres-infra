variable "db_name" {
  description = "Database name"
  type        = string
  default     = "discord"
}

variable "db_username" {
  description = "Database admin username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "cloud_provider" {
  description = "Cloud provider (aws, azure, gcp)"
  type        = string
  default     = "aws"
}

variable "region" {
  description = "Cloud region"
  type        = string
  default     = "ap-east-1"
}
