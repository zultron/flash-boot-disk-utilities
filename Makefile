FILES = README.md syslinux.cfg

# Default target
all:

# ThinkPad no1802 BIOS patch
NO1802_DIR = boot/tp1802
include $(NO1802_DIR)/Makefile

# ThinkPad BIOS and Embedded Controller updates
X31_DIR = boot/x31-bios
include $(X31_DIR)/Makefile

# Use sudo for non-root users
ifneq ($(shell whoami),root)
  SUDO = sudo
endif

check_disk:
	if test -z "$(DISK)"; then \
	    echo "Please define DISK=/dev/sdX on command line" >&2; \
	    exit 1; \
	fi
	test -b $(DISK)

check_dest_dir:
	if test -z "$(DEST_DIR)"; then \
	    echo "Please define DEST_DIR=... on command line" >&2; \
	    exit 1; \
	fi

# Run syslinux
SYSLINUX = $(shell test -d /usr/lib/syslinux \
	    && echo /usr/lib/syslinux \
	    || echo /usr/share/syslinux)
ifeq ($(SYSLINUX),)
$(error Unable to locate SYSLINUX directory; please specify on command line)
endif
syslinux:
	$(MAKE) check_disk
	sudo syslinux -i $(DISK)1
	sudo dd conv=notrunc bs=440 count=1 if=$(SYSLINUX)/mbr.bin of=$(DISK)
	sudo parted $(DISK) set 1 boot on
.PHONY: syslinux

# Mount flash drive
mount:
	$(MAKE) check_disk
	$(MAKE) check_dest_dir
	sudo mount $(DISK)1 $(DEST_DIR)

# Copy files to dest directory
copy: $(FILES)
	$(MAKE) check_dest_dir
	tar cf - $(FILES) | \
	    $(SUDO) tar xvCf "$(DEST_DIR)" - || true
.PHONY: copy

# Unmount flash drive
unmount:
	$(MAKE) check_disk
	sudo umount $(DISK)1

all: $(FILES)
	$(MAKE) syslinux
	$(MAKE) mount
	$(MAKE) copy
	$(MAKE) unmount

