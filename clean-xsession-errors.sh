#!/bin/bash

[ $(du -k .xsession-errors | awk '{ print $1 }') -gt 5000000 ] && tail -10000 /home/$(whoami)/.xsession-errors > /home/$(whoami)/.xsession-errors
