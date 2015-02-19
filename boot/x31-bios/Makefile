############### X31 BIOS and Embedded Controller ###############
X31_URL = http://www.thinkpads.com/support/Thinkpad-Drivers/download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles

X31_DOWNLOADS = 1quj19us.exe 1quj19us.txt 1qhj08us.exe 1qhj08us.txt
X31_DOWNLOAD_FILES = $(patsubst %,$(X31_DIR)/%,$(X31_DOWNLOADS))

$(X31_DOWNLOAD_FILES):
	wget $(X31_URL)/$(notdir $@) \
	    -O $@

$(X31_DIR)/1QUJ19US.IMG: $(X31_DIR)/1quj19us.exe
	cd $(X31_DIR) && cabextract -F $(notdir $@) $(notdir $<)
	touch $@

$(X31_DIR)/1QUJ08US.IMG: $(X31_DIR)/1qhj08us.exe
	cd $(X31_DIR) && cabextract -F $(notdir $@) $(notdir $<)
	touch $@

X31_FILES = 1QUJ08US.IMG 1QUJ19US.IMG README.md syslinux.cfg
FILES += $(patsubst %,$(X31_DIR),$(X31_FILES))
