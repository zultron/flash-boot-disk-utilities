# Default target
all:

# ThinkPad BIOS and Embedded Controller updates
X31_DIR = boot/x31-bios
include $(X31_DIR)/Makefile

all: $(TARGETS)
