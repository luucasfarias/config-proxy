#!/bin/bash

# checa se o proxy não está vazio.
# fazer checagem para a matricula tambem.
# checar tambem as permissões de root para salvar no dnf.conf e enviroment em /etc

echo "-------------------------------------"
echo "Configuração proxy, OS Fedora 28 ou >"
echo "-------------------------------------"

echo "OBS: Esteja logado como super usuário"

read -p "Proxy: " proxy
read -p "Matricula: " matricula
read -sp "Senha: " senha

echo ""

dnf_conf="/etc/config-proxy.txt"
enviroment="/etc/config-enviroment.txt"

if [ -z $proxy ]
then 
    echo "Atenção. Proxy é obrigatório!"
else
    read -p "Digite 1 para salvar a configuração no arquivo dnf.conf: " conf
    if [ $conf -eq 1 ]
    then
        echo "proxy=http://$proxy" >> $dnf_conf
        echo "proxy_username=$matricula" >> $dnf_conf
        echo "proxy_password=$senha" >> $dnf_conf

        echo "Arquivo dnf.conf configurado!"
        
        echo "HTTP_PROXY=$matricula:$senha@$proxy" >> $enviroment
        echo "HTTPS_PROXY=$matricula:$senha@$proxy" >> $enviroment
        echo "FTP_PROXY=$matricula:$senha@$proxy" >> $enviroment

        echo "http_proxy=$matricula:$senha@$proxy" >> $enviroment
        echo "https_proxy=$matricula:$senha@$proxy" >> $enviroment
        echo "ftp_proxy=$matricula:$senha@$proxy" >> $enviroment
        echo "no_proxy=$matricula:$senha@$proxy" >> $enviroment

        echo "Arquivo enviroment configurado!"

       # export HTTP_PROXY HTTPS_PROXY FTP_PROXY http_proxy https_proxy ftp_proxy no_proxy
    else
        echo "Operação cancelada, você não digitou um valor válido"
    fi
fi