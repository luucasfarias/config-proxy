# Settings-proxy

Este projeto consiste em shell script com o objetivo de automatizar a configuração do proxy em redes autenticadas. Este script foi pensado para o OS Fedora 28, porém é possível utilizar em outras distribuiçoes linux.

### Iniciando

Para fazer uso deste script faça baixe o arquivo settings-proxy.sh com o comando abaixo:

```sh
$ wget https://github.com/luucasfarias/config-proxy/blob/master/settings-proxy.sh
```

Procure o arquivo settings-proxy.sh no local escolhido para o download. Altere as permisssões do arquivo para que ele possa ser executado no seu ambiente.

```sh
$ chmod +x settings-proxy.sh
```
## Executando o script

Para executar o script, é preferivel que esteja logado como super usuario(root), para isso faça:

```sh
$ sudo ./settings-proxy.sh
```

Agora será possível prosseguir com a sua configuração, abaixo segue um modelo de como deverá realizar o procedimento.

OBS: A matrícula é seu username.

```sh
Proxy: proxy.test.com.br:3128
Matricula: 4049
Senha: sua_senha
```
OBS: Para aplicar a configuração digite 1, qualquer outro digito o programa cancelará a configuração.


## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.


## Authors

* **Lucas Farias** - [Lucas Farias](https://github.com/luucasfarias)


## Licença

Este projeto está licenciado sob a licença MIT - consulte o arquivo [LICENSE.md] (LICENSE.md) para obter detalhes.