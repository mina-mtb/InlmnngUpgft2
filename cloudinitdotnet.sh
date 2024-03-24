#!/bin/bash

# Get Ubuntu version
repo_version=$(if command -v lsb_release &> /dev/null; then lsb_release -r -s; else grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"'; fi)
# Download Microsoft signing key and repository
wget https://packages.microsoft.com/config/ubuntu/$repo_version/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
# Install Microsoft signing key and repository
dpkg -i packages-microsoft-prod.deb
# Clean up
rm packages-microsoft-prod.deb
# Update packages
apt update
apt-get install -y aspnetcore-runtime-8.0
cat << 'EOF' > /etc/systemd/system/InlmnngUpgft2.service
[Unit]
Description=My very first ASP.NET Core applications running on Ubuntu

[Service]
WorkingDirectory=/opt/InlmnngUpgft2
ExecStart=/usr/bin/dotnet /opt/InlmnngUpgft2/InlmnngUpgft2.dll
Restart=always
# Restart service after 10 seconds if the dotnet service crashes:
RestartSec=10
KillSignal=SIGINT
SyslogIdentifier=dotnet-example
User=www-data
Environment=ASPNETCORE_ENVIRONMENT=Development
Environment=DOTNET_PRINT_TELEMETRY_MESSAGE=false
Environment=ASPNETCORE_URLS="http://*:5000"

[Install]
WantedBy=multi-user.target
EOF