sudo passwd sonar
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart

cd /opt
sudo yum -y install unzip wget git
sudo yum install  java-11-openjdk-devel

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip
sudo unzip sonarqube-9.9.0.65466.zip
sudo rm -rf sonarqube-9.9.0.65466.zip
sudo mv sonarqube-9.9.0.65466 sonarqube

sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/

sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status
