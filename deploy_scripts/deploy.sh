#! /bin/bash
ansible-playbook /var/lib/jenkins/workspace/DEV_maven_webpipeline/deploy_scripts/playbook/dev_webserver.yml
scp /var/lib/jenkins/workspace/DEV_maven_webpipeline/target/dev-maven-web-project-1.1-SNAPSHOT.war root@192.168.1.180:/var/www/html

