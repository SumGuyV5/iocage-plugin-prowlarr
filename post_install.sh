#!/bin/sh -x
IP_ADDRESS=$(ifconfig | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk '{ print $2}')

fetch https://github.com/Thefrank/freebsd-port-sooners/releases/download/20211015/prowlarrdotnet-0.1.1.978.pkg

pkg install -y prowlarrdotnet-0.1.1.978.pkg
rm prowlarrdotnet-0.1.1.978.pkg

sysrc prowlarrdotnet_enable=TRUE

service prowlarrdotnet start

echo -e "Prowlarr now installed.\n" > /root/PLUGIN_INFO
echo -e "\nPlease open your web browser and go to http://${IP_ADDRESS}:9696 to configure Prowlarr.\n" >> /root/PLUGIN_INFO