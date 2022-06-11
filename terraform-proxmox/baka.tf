resource "proxmox_vm_qemu" "baka" {

    name = "baka" 
    desc = "Ubuntu Server"
    vmid = "401"
    target_node = "pve"

    agent = 1 
    clone = "ubuntu-cloud"
    cores = 4
    sockets = 2 
    cpu = "host"
    memory = 8192

    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    disk { 
        storage = "local-lvm"
        type = "virtio"
        size = "300G"
    }

    os_type = "cloud-init"
    ipconfig0 = "ip=10.0.0.24/24,gw=10.0.0.1"
    nameserver = "10.0.0.1"
    ciuser = "xcad"
    

}