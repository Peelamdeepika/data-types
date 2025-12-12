#!/bin/bash

USERID=$(id -u)

Validate() {
    if [ $1 -ne 0 ]; then
   echo " $2 is failure "
   exit 1
   else
   echo "$2 is success"
fi
}

if [ $USERID -ne 0 ];
  then
   echo "you need root access"
   exit 1
fi

yum update –y

Validate $? "ym upgraded"

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

Validate $? "repo upgrade"

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

Validate $? "Key impoted"

yum upgrade -y

Validate $? "upgared"

yum install java-21-amazon-corretto -y

Validate $? "java installed"

yum install jenkins -y

Validate $? "jenkins installed"

systemctl enable jenkins

Validate $? "jenkins enabled"

systemctl start jenkins

Validate $? "jenkins started"

systemctl status jenkins

Validate $? "jenkins status"












