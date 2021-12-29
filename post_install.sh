#!/bin/sh -x
IP_ADDRESS=$(ifconfig | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk '{ print $2}')

sysrc prowlarr_enable=TRUE

chown -R prowlarr:prowlarr /usr/local/share/prowlarr

chmod 755 /usr/local/prowlarr

service prowlarr start

echo -e "Prowlarr now installed.\n" > /root/PLUGIN_INFO
echo -e "\nPlease open your web browser and go to http://${IP_ADDRESS}:9696 to configure Prowlarr.\n" >> /root/PLUGIN_INFO