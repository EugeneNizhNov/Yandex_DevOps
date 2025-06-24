variable "name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "chapter5-lesson2-std-037-51"
}

variable "platform_id" {
  description = "Platform ID for the virtual machine"
  type        = string
  default     = "standard-v3"
}

variable "zone" {
  description = "Zone where the virtual machine will be deployed"
  type        = string
  default     = "ru-central1-a"
}

variable "cores" {
  description = "Number of CPU cores for the virtual machine"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Amount of RAM for the virtual machine (in GB)"
  type        = number
  default     = 2
}

variable "image_id" {
  description = "Image ID for the operating system"
  type        = string
  default     = "fd80qm01ah03dkqb14lc"
  #default     = "fd834mcknpoei6h5ve3a"
}

variable "disk_size" {
  description = "Size of the boot disk (in GB)"
  type        = number
  default     = 30
}

variable "subnet_id" {
  description = "Subnet ID where the virtual machine will be connected"
  type        = string
  default     = "e9b72t8g01fkr4fagkrd"
}

variable "security_group_ids" {
  description = "List of Security Group IDs to attach to the virtual machine"
  type        = string
  default     = "enp2hq3upusqa5qlc2of"
}

variable "metadata_file_path" {
  description = "Path to the metadata YAML file"
  type        = string
  default     = "/home/eugene/terraform/cloud-init.yaml"
}