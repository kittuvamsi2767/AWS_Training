#! /bin/bash
aws ec2 start-instances --instance-ids i-094ece8eabd8ff10c
ansible-playbook /var/lib/jenkins/workspace/DEV_maven_webpipeline/deploy_scripts/playbook/dev_webserver.yml
ssh root@192.168.1.180 rm /var/www/html/dev-maven-web-project-1.1-SNAPSHOT.war
scp /var/lib/jenkins/workspace/DEV_maven_webpipeline/target/dev-maven-web-project-1.1-SNAPSHOT.war root@192.168.1.180:/var/www/html
ssh root@192.168.1.180 chmod 777 /var/www/html/dev-maven-web-project-1.1-SNAPSHOT.war
