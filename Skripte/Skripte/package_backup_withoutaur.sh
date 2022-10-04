#!/bin/bash
pacman -Qqe | grep -v "$(pacman -Qqm)" > ~/Dropbox/package_list_wa.txt


