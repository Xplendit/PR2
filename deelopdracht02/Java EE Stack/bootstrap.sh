 #!/bin/bash
 # provision.sh 
sudo yum -y update
sudo yum -y install java-1.7.0-openjdk* tomcat*

sudo systemctl start firewalld
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl restart firewalld
sudo systemctl enable firewalld
cd ../../usr/share/tomcat/conf
sudo chmod 666 tomcat-users.xml
> tomcat-users.xml
echo "<?xml version='1.0' encoding='utf-8'?>" > tomcat-users.xml
echo '<tomcat-users>
<role rolename="manager-gui" />
<role rolename="manager-status" />
<role rolename="manager-script" />
<role rolename="manager-jmx" />

<role rolename="admin-gui" />
<role rolename="admin-script" />

<user username="admin" password="admin" roles="manager-gui, admin-gui"/>
<user username="user" password="user" roles="manager-gui"/>
</tomcat-users>' >> tomcat-users.xml
sudo systemctl start tomcat
