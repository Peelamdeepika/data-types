#!/bin/bash
USERID=$(id -u)

FOLDER="/var/log/shell-scripting-logs"
TIME_STAMP=$(date +%y-%m-%d)
FILE=JANUARY
FILE_NAME="$FOLDER/$FILE-$TIME_STAMP.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"

Validate() {
  if [ $1 -ne 0 ]; then
   echo -e "$2... has not  $R installed"
   exit 1
   else
   echo -e "$2... has installed  $Y successfully"
  fi 
}
 
if [ $USERID -eq 0 ]; then
  echo "$R you need root access"
  exit 1
fi  

for PACKAGE in $@
do
   dnf list installed $PACKAGE 
   if [ $? -ne 0 ]; then
      echo " now installing $PACKAGE"
      dnf install $PACKAGE -y
      Validate $? "$PACKAGE"
    else
     echo "$PACKAGE is already installed in your server" 
    fi
done      