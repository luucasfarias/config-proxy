#!/bin/bash
echo "Configuração proxy, OS Fedora 28 ou >"

read -p "Proxy: " proxy

read -p "Matricula: " matricula

read -sp "Senha: " senha
echo ""

# checa se o proxy não está vazio.
# fazer checagem para a matricula tambem.
# checar tambem as permissões de root para salvar no dnf.conf e enviroment em /etc

if [ -z $proxy ]
then 
    echo "Atenção. Proxy é obrigatório!"
else
    read -p "Digite 1 para salvar a configuração no arquivo dnf.conf: " conf
    if [ $conf -eq 1 ]
    then
        echo "proxy=$proxy" >> config-proxy.txt
        echo "proxy_username=$matricula" >> config-proxy.txt
        echo "proxy_password=$senha" >> config-proxy.txt

        echo "A sua configuração foi salva"
    else
        echo "Operação cancelada, você não digitou um valor válido"
    fi
fi