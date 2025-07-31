# Create new instance that use the bucket
resource "google_compute_instance" "another_instance" {
    name         = "terraform-instance-2"
    machine_type = "e2-micro"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }
    network_interface {
        network = "default"
    }
    # Tells Terraform that this VM instance must be created only after the 
    # storage bucket has been created 
    depends_on = [google_storage_bucket.example_bucket]

}

# New resource for the storage bucket our applicaton will use 
resource "google_storage_bucket" "example_bucket" {
    name = "emdy-master-bucket-3310"
    location = "US"
    website {
        main_page_suffix = "index.html"
        not_found_page    = "404.html"
    }
}