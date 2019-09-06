#!/bin/bash

#<jeliasmoreira@gmail.com>


#Script shell para testar o retonro de um site


#Ele será invocado pela função provisioner do terraform para execução local do script.
#Ira receber como primeiro argumento o endereco IP publico da instancia AWS EC2 privisionada via terraform.
#O valor do IP publico chega através da variavel ${self.public_ip}



HTTP_STATUS_CODE_OK="200"
CURL="/usr/bin/curl"
RESPONSE="$(curl -s -o /dev/null -I -w "%{http_code}" http://$1)"

if [ $RESPONSE -eq $HTTP_STATUS_CODE_OK ] ;
then
{ 
    echo "Check do deploy da APP realizado com sucesso - TUDO OK"

} else {

    echo "Check do deploy da APP com retorno negativo - FALHA"

} fi