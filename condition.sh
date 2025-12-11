#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
echo "you need root access"

yum install git -y
fi

if  [ $? -ne 0 ]; then

echo "git not installed"

else

echo "git got successfully installed"
fi