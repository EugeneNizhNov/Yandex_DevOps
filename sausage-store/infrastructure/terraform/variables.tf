variable "token" {
  description = "Token of the Yandex Cloud"
  type        = string
  sensitive   = true
}
variable "cloud_id" {
  description = "ID of the Yandex Cloud organization"
  type        = string
}

variable "folder_id" {
  description = "Folder ID where resources will be deployed"
  type        = string
}

variable "zone" {
  description = "Availability zone for resources"
  type        = string
  default = "ru-central1-a"
}

