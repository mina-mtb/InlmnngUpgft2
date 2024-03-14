sudo nano /etc/systemd/system/inlmnngupgft2/vmASP.service
// ska spara alla vmASP filer i pages som öpnas och spara dem i /etc/systemd/system/inlmnngupgft2/vmASP.service

sudo systemctl daemon-reload
sudo systemctl enable inlmnngupgft2/vmASP.service