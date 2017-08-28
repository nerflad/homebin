#!/bin/sh

if [ $EUID -gt 0 ]; then
    echo You must run this script AS ROOT. sudo or SETUID will not work.
    exit 1
fi

echo EHC1 > /proc/acpi/wakeup
echo EHC2 > /proc/acpi/wakeup
echo XHCI > /proc/acpi/wakeup
