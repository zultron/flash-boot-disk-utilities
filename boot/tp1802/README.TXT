Thinkpad WiFi Patchset

For more information:

http://www.thinkwiki.org/wiki/Problem_with_unauthorized_MiniPCI_network_card
http://www.command-tab.com/2006/02/26/thinkpad-1802-error-fix/

Use this program to get rid of the following boot errors:

    1802  Unauthorized network card is plugged in. 
    Power off and remove the Mini PCI network card.

    01C9  More than one Ethernet devices are found. 
    Remove one of them and press the Esc key to continue.

1. - Remove the card if you can't get around the 1802 error
   - Boot this program and apply the CMOS patch

2. Atheros cards only:
   - If encountering the 01C9 warning with card reinserted, boot again
   - Select "No" at the 1802 patch prompt.
   - The software will auto detect your Atheros card and patch it.

Warning! These patches directly modify your hardware.
Use at your own risk!!

