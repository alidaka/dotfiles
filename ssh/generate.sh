#!/bin/sh -e

eval $(/usr/bin/ssh-agent -s)
/usr/bin/ssh-keygen -t rsa -b 4096
