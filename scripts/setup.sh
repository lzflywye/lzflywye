#!/bin/sh

sudo mkdir -p /etc/systemd/system/user@.service.d/

sudo cp ./etc/systemd/user-delegate.conf /etc/systemd/system/user@.service.d/delegate.conf

sudo systemctl daemon-reload
