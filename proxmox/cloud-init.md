# Create a cloud init template

## Download ubuntu img 

wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

## Create vm template 
qm create 8000 --memory 8192 --name ubuntu-cloud --net0 virtio,bridge=vmbr0

## Link img to vm 
qm importdisk 8000 jammy-server-cloudimg-amd64.img local-lvm

## Attach the disk 
qm set 8000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-8000-disk-0

## Add cloud init drive
qm set 8000 --ide2 local-lvm:cloudinit

## Make the drive bootable 
qm set 8000 --boot c --bootdisk scsi0

## Add serial console 
qm set 8000 --serial0 socket --vga serial0

## resoucres 

- https://www.youtube.com/watch?v=shiIi38cJe4 (create vm template)
- https://www.youtube.com/watch?v=dvyeoDBUtsU (terraform config with proxmox)
- https://cloud-images.ubuntu.com/jammy/current/ (ubuntu 22.04 img )
- https://docs.technotim.live/posts/cloud-init-cloud-image/ 