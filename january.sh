#!/bin/bash
USERID=$(id -u)

FOLDER="/var/log/shell-scripting-logs"
TIME_STAMP=$(date +%y-%n-%d)
FILE=$(echo $0)
FILE_NAME="$FOLDER/$FILE-$TIME_STAMP.log"


Vlaidate() {
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

if [ $USERID -ne 0 ]; then
    echo -e "$R you need root access"
    exit 1
fi

 yum install git -y &>>$FILE_NAME

Vlaidate $?  "git is"

yum install mysql -y

Vlaidate $? "mysql is"