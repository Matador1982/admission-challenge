#!/bin/bash
# Use sed to make modifications in-place
sudo sed -i '/Require all denied/{
    s/denied/granted/
    a\
    SetEnvIf Request_URI "\/favicon\\.ico$" dontlog
}' /etc/apache2/sites-available/000-default.conf
# Reload Apache Configuration
sudo service apache2 reload
