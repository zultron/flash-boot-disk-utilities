# ThinkPad X31 BIOS

Apparently X31 BIOS downloads have been expunged from ibm.com and
lenovo.com.  These came from [thinkpads.com].

Check current BIOS version:

    sudo dmidecode -s bios-version

Check current Embedded Controller version:

    sudo dmidecode -t11 -q

Below are the latest versions.  The `Makefile`, included from the top
directory, will download and extract the floppy images.  The
required `cabextract` utility comes from RPMFusion on Fedora.

## BIOS update
v. 3.02/1QET97WW, 10 Oct 2005
- software 1quj19us

## Embedded Controller program
v. 1.08/1QHT23WW, 29 Aug 2005
- software 1qhj08us

[thinkpads.com]:
http://www.thinkpads.com/support/Thinkpad-Drivers/download.lenovo.com/lenovo/content/ddfm/X31.html

