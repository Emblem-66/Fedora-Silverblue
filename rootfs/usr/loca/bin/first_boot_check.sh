#!/bin/bash

setup_file="~/.config/first_boot_true"

if [ ! -f "$setup_file" ]; then
    /usr/local/bin/first_boot_script.sh
    touch "$setup_file"
fi
