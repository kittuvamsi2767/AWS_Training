#! /bin/bash
DEV_server=192.168.1.180
QA_server=192.168.1.112
DEV_instance_id=i-094ece8eabd8ff10c
QA_instance_id=i-0ba569627cd5eda72
ENV=$1
SERVER=${ENV}_server
INSTANCE_ID=${ENV}_instance_id
echo "server_ip  ${!SERVER}"
echo "instance_id ${!INSTANCE_ID}"
aws ec2 start-instances --instance-ids ${!INSTANCE_ID}   
ansible-playbook /var/lib/jenkins/workspace/${ENV}_maven_webpipeline/deploy_scripts/playbook/${ENV}_webserver.yml
#chmod 777 /var/lib/jenkins/workspace/${ENV}_maven_webpipeline/target/maven-web-project-1.1-SNAPSHOT.war
#mv /var/lib/jenkins/workspace/${ENV}_maven_webpipeline/target/maven-web-project-1.1-SNAPSHOT.war /var/lib/jenkins/workspace/${ENV}_maven_webpipeline/target/${ENV}-maven-web-project-1.1-SNAPSHOT.war
ssh root@${!SERVER} rm /var/www/html/${ENV}-maven-web-project-1.1-SNAPSHOT.war
scp /var/lib/jenkins/workspace/${ENV}_maven_webpipeline/target/${ENV}-maven-web-project-1.1-SNAPSHOT.war root@${!SERVER}:/var/www/html
ssh root@${!SERVER} chmod 777 /var/www/html/${ENV}-maven-web-project-1.1-SNAPSHOT.war
