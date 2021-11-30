#! /bin/bash
ansible-playbook deploy_scripts/playbook/dev_webserver.yml
scp target/dev-maven-web-project-1.2-SNAPSHOT.war root@192.168.1.180:/var/www/html
ssh root@192.168.1.180 chmod 777 /var/www/html/*
