# About
for yTMP thermo monitor server

# Requirement
* VirtualBox
* Vagrant
* AWS CLI
* DynamoDB Local(Downloadable Version) via localhost:8000

# Preparation
Install [Requirement tools](#Requirement), then
```
# see https://www.devopsroles.com/vagrant-no-virtualbox-guest-additions-installation-found-fixed/
vagrant plugin install vagrant-vbguest --plugin-version 0.21
# if you are in proxy, execute it and set proxy configuration
vagrant plugin install vagrant-proxyconf
# for DynamoDB setup
aws dynamodb create-table --cli-input-json file://LOGIN_HISTORY.json --endpoint-url http://localhost:8000
```

# How to use
```
vagrant up
# run DynamoDB Local on host computer
java -Djava.library.path=.\DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb
```

# Includes
* PostgreSQL 12.2
* Redis 5.0.6

# Usage
## PostgreSQL(schema:test00)
for thermo-monitor server
access by `jdbc:postgresql://localhost:5432/test01`

## Redis
initial state(no password)
