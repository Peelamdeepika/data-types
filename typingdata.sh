#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
   echo "installing mysql"
   dnf install mysql -y
else
   echo "you should have root privelages"
fi
