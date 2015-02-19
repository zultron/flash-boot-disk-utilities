# Boot utility disk

Created following the [syslinux bootable USB] instructions

[syslinux bootable USB]:
http://www.syslinux.org/wiki/index.php/HowTos#How_to_Create_a_Bootable_USB:_For_Linux

# Create bootable USB flash drive

- Flash drive must be formatted with `FAT` filesystem
- On Ubuntu, need `syslinux` and `mtools` packages
- Insert flash drive and run the following commands

```
# Check these are correct
DISK=/dev/sdX               # Flash drive
MOUNT_POINT=/mnt/tmp        # Mount point for flash drive
SOURCES=$(pwd)              # The directory containing this file
# Ubuntu:
SYSLINUX=/usr/lib/syslinux
# Fedora:
#SYSLINUX=/usr/share/syslinux

# Set up bootable flash drive
sudo syslinux -i ${DISK}1
sudo dd conv=notrunc bs=440 count=1 if=${SYSLINUX}/mbr.bin of=${DISK}
sudo cp ${SYSLINUX}/memdisk ${MOUNT_POINT}/boot
sudo parted ${DISK} set 1 boot on

# Copy these sources to flash drive
sudo mount ${DISK}1 ${MOUNT_POINT}
sudo cp -R ${SOURCES}/* ${MOUNT_POINT}
sudo umount ${MOUNT_POINT}
```

# Utilities

- ThinkPad [1802 unauthorized MiniPCI network card] BIOS patch
  - See `boot/tp1802/README.TXT`
- ThinkPad BIOS and Embedded Controller updates
  - See `boot/x31-bios/README.md`

[1802 unauthorized MiniPCI network card]:
http://www.thinkwiki.org/wiki/Problem_with_unauthorized_MiniPCI_network_card
