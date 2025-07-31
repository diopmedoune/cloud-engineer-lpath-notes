resource "google_compute_address" "vm_static_ip" {
    name = "terraform-static-ip"
}

resource "google_compute_instance" "vm_intance" {
    name        = "${var.instance_name}"
    zone        = "${var.instance_zone}"
    machine_type = "${var.instance_type}"
    boot_disk {
        initialize_params {
        image = "${var.instance_image}"
      }
    }
    network_interface {
        network = "default"
        access_config {
            # Allocate a on-to-one NAT IP to the instance
            nat_ip = google_compute_address.vm_static_ip.address
        }
    }
}

