#! /bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

function CheckUser () {
   USER_ID=$(/usr/bin/id -u)
   return $USER_ID
}
echo -e "${GREEN}Iniciando configuração, aguarde...${NOCOLOR}"

CheckUser
if [ $? -ne "0" ]
    then
    echo -e "${RED}Voce não é root, execute como super-usuário!n${NOCOLOR}"
    exit 1

    else
    dnf_conf="/etc/config-proxy.txt"
    enviroment="/etc/config-enviroment.txt"

    read -p "Proxy: " proxy
    read -p "Matricula: " matricula
    read -sp "Senha: " senha

    echo ""

    if [ -z $proxy ] || [ -z $matricula ]
        then
        echo -e "${RED}Atenção. Proxy e matrícula são obrigatórios!${NOCOLOR}"
        exit 1
    else
        read -p "Digite 1 para realizar a configuração: " confirmacao
        if [ $confirmacao -eq 1 ]
            then
                if [ -e $dnf_conf ] && [ -e $enviroment ]
                    then
                    echo "proxy=http://$proxy" >> $dnf_conf
                    echo "proxy_username=$matricula" >> $dnf_conf
                    echo "proxy_password=$senha" >> $dnf_conf

                    echo "HTTP_PROXY=$matricula:$senha@$proxy" >> $enviroment
                    echo "HTTPS_PROXY=$matricula:$senha@$proxy" >> $enviroment
                    echo "FTP_PROXY=$matricula:$senha@$proxy" >> $enviroment

                    echo "http_proxy=$matricula:$senha@$proxy" >> $enviroment
                    echo "https_proxy=$matricula:$senha@$proxy" >> $enviroment
                    echo "ftp_proxy=$matricula:$senha@$proxy" >> $enviroment
                    echo "no_proxy=$matricula:$senha@$proxy" >> $enviroment

                    # export HTTP_PROXY HTTPS_PROXY FTP_PROXY http_proxy https_proxy ftp_proxy no_proxy
                    echo -e "${GREEN}Configuração realizada com sucesso!${NOCOLOR}"
                    else
                    echo -e "${RED}Ops, configuração cancelada, seus arquivos de configuração não existem!${NOCOLOR}"
                    exit 1
                fi
            else
            echo -e "${RED}Operação cancelada, você não digitou um valor válido${NOCOLOR}"
            exit 1
        fi
    fi
fi
