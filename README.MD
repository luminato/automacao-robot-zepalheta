## Projeto Robot web

Construção da automação do site zepalheta

## Descrição

Testar todas as funcionalidades do site usando Robot, aplicação de page object e padrão de projeto.

## Requisitos minimos para o teste

- [x] Python
- [x] Docker
- [x] visual code

## Comandos Básicos

execução de todo o teste
```sh
robot -d ./logs tests
```

## configuração do ambiente

-criando o ambiente docker

subindo ambiente
```sh
docker-compose up -d
```
carregando arquivos de configurações 
```sh
docker exec -it zepalheta-api sh /home/node/api/setup.sh
```


[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square





