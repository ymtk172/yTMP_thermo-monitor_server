sudo yum update -y
sudo yum upgrade -y
sudo yum install -y yum-utils   device-mapper-persistent-data   lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
cd /home/vagrant/postgresql
/usr/local/bin/docker-compose up -d
cd /home/vagrant/redis
/usr/local/bin/docker-compose up -d

# commands ref
### sudo /usr/local/bin/docker-compose up -d
### sudo docker exec -it appdb bash
### sudo docker logs appdb
## exec psql
sudo docker exec -it appdb /bin/bash -c "psql -U test01 -c \"select * from user;\""
sudo docker exec -it appdb /bin/bash -c "psql -U test01 -c \"select * from users;\""
