#!/bin/bash
USERID=$(id -u)

FOLDER="/var/log/shell-scripting-logs"
TIME_STAMP=$(date +%y-%m-%d)
FILE=JANUARY
FILE_NAME="$FOLDER/$FILE-$TIME_STAMP.log"


Validate() {
  if [ $1 -ne 0 ]; then
   echo -e "$2... $R not installed"
   exit 1
   else
   echo -e "$2... $G installed successfully"
  fi 
}

R="\e[31m"
G="\e[32m"
Y="\e[33m"

for PACKAGE in $@
do
   dnf list $PACKAGE 
   if [ $PACKAGE -ne 0 ]; then
      echo " installing $PACKAGE"
      dnf install $PACKAGE
      Validate $? "$PACKAGE"
    else
     echo "$PACKAGE is already installed" 
    fi
done      