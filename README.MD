## Projeto Robot web

Construção da automação Web e API do Zepalheta

## Descrição

Testar todas as funcionalidades do site usando Robot, aplicação de page object e padrão de projeto.

## Requisitos minimos para o teste

- [x] Python
- [x] Docker
- [x] visual code
- [x] Insomnia

## Comandos Básicos

execução de todo o teste
```sh
robot -d ./logs tests
```

## configuração do ambiente

#### criando o ambiente docker

configurando e subindo ambiente
```sh
docker-compose up -d
```
carregando arquivos de configurações da api 
```sh
docker exec -it zepalheta-api sh /home/node/api/setup.sh
```

#### Adicionando bibliotecas do requirements

executar para instalação
```sh
pip install -r requirements.txt
```


[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square





