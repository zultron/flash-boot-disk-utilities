# Boot utility disk

Created following the [syslinux bootable USB] instructions

[syslinux bootable USB]:
http://www.syslinux.org/wiki/index.php/HowTos#How_to_Create_a_Bootable_USB:_For_Linux

# Create bootable USB flash drive

- Flash drive must be formatted with `FAT` filesystem
- The `syslinux` and `mtools` packages are required
- The `cabextract` utility must be available; from RPMFusion on Fedora
- Insert flash drive and run the following commands

To install, simply cd to this directory, and run `make` with the
following variables set; customize as needed:

    make DISK=/dev/sdX DEST_DIR=/mnt/tmp

# Utilities

- ThinkPad [1802 unauthorized MiniPCI network card] BIOS patch
  - See `boot/tp1802/README.TXT`
- ThinkPad BIOS and Embedded Controller updates
  - See `boot/x31-bios/README.md`

[1802 unauthorized MiniPCI network card]:
http://www.thinkwiki.org/wiki/Problem_with_unauthorized_MiniPCI_network_card
