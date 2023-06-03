#!/bin/bash
set -e
echo "*****    Installing Nginx    *****"
apt update
apt install -y nginx
systemctl enable nginx
systemctl restart nginx

echo "*****   Installation Complteted!!   *****"

echo "*****   Startup script completes!!    *****"