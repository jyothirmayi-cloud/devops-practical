# variables.tf

variable "docker_image" {
  description = "Docker image for the application"
  type        = string
  default     = "devops-practical-app:latest"
}
