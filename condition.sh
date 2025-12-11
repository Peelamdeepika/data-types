#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ];
 then 
    echo "you need root priveilages"
  exit 1  
fi

yum install mysql -y

if [ $? -ne 0 ];
  then
   echo "mysql is not installed"
   
  else
     echo "mysql installed successfully"
  fi    