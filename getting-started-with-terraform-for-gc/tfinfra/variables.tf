variable "instance_name" {
    type        = string 
    description = "Name for the Google Compute instance"
}

variable "instance_zone" {
    type        = string 
    description = "Zone for the Google Cloud instance"
}

variable "instance_type" {
    type        = string 
    description = "Disk type of the Google Compute instance"
    default     = "e2-medium"
}

variable "instance_image" {
    type        = string 
    description = "Image for the Google Compute instance"
    default     = "projects/debian-cloud/global/images/debian-12-bookworm-v20250709"
}