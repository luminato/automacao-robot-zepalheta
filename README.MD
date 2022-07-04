## Projeto Robot web

Construção da automação Web e API do Zepalheta

## Descrição

Testar todas as funcionalidades do site usando Robot, aplicação de page object e padrão de projeto.

## Requisitos minimos para o teste

- [x] Python
- [x] Docker
- [x] visual code
- [x] Insomnia
- [x] Jenkins

## Comandos Básicos

execução de todo o teste em tela
```sh
robot -d ./logs/ -v browser:chrome tests/
```

execução de todo o teste em headless (back)
```sh
robot -d ./logs/ -v browser:headless tests/
```

## configuração do ambiente

### criando o ambiente docker

-execute o arquivo "setup.bat" para configuração automatica do docker.

configurando e subindo ambiente manualmente
```sh
docker-compose up -d
```
carregando arquivos de configurações da api 
```sh
docker exec -it zepalheta-api sh /home/node/api/setup.sh
```
descendo a aplicação para atualizações (apenas após alteração de versão) 
```sh
docker-compose down
docker-compose up -d
docker exec -it zepalheta-api sh /home/node/api/setup.sh
```

## Adicionando bibliotecas

executar para instalação
```sh
pip install -r requirements.txt
```

## comando adicionais para configurações do jenkins

propiedade para autorização dos logs em tela no jenkins
```sh
System.setProperty("hudson.model.DirectoryBrowserSupport.CSP","sandbox allow-scripts; default-src 'none'; img-src 'self' data: ; style-src 'self' 'unsafe-inline' data: ; script-src 'self' 'unsafe-inline' 'unsafe-eval' ;")
```


[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square





