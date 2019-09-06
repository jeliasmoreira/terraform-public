#!/bin/bash

#Script shell para geração de aws key pair 
#Deve ser executado na rapiz deste repositorio

#VARS

PATH="./keys/"
KEY_NAME="webserver01"
WEBSERVER_KEY_NAME="webserver01.pem"
AWS="/usr/bin/aws"
CHMOD="/bin/chmod"

#Geranco key pain

cd $PATH
 $AWS ec2 create-key-pair --key-name $KEY_NAME --output text > $WEBSERVER_KEY_NAME
 $CHMOD 400 $WEBSERVER_KEY_NAME
