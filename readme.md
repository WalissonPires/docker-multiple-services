# Executar multiplos serviços web na mesma imagem docker

> ATENÇÃO: Não é recomendado executar esse procedimento em produção.

Foi utilizado uma imagem do servidor web **Nginx** como base. O **Nginx** atua como proxy entre os serviços web.

Nesse exemplo foi criado duas aplicações nodejs que são executadas/gerenciadas atráves do **PM2**.

Portanto todas as requisição serão tratas pelo **NGINX** e passadas para o serviço solicitado.

# Criar a imagem
```sh
docker build -t multiple-services:latest .
```

# Executar o container
```sh
docker run -p 8080:80 multiple-services:latest
# Acesse os serviços em http://127.0.0.1:8080/service1 e http://127.0.0.1:8080/service2
```

# Arquivos importantes

Segue uma breve explicação dos arquivos necessário para criação da imgem.

## nginx.conf

O **nginx.conf** é o arquivo usado para configurar o **Nginx**. Nele é especificado a uri de cada serviço e qual porta em que o mesmo está ouvindo.

## ecosystem.config.js

O **ecosystem.config.js** é o arquivo usado informar ao **PM2** como e quais serviços ele deve executar/gerenciar.

## Dockerfile

Para a construção da imagem foi usada como base a imagem no **Nginx**, que é a peça principal. A imagem é construida com os seguintes passos:

- E feita a instalação de todos que é preciso para executar os serviços, como instalar o **NodeJS** e o **PM2**;
- É feita a cópia do código fonte da aplicação;
- É feita a cópia do arquivo de configuração do **Nginx**;
- E por fim iniciamos o **PM2**, que irá iniciar os serviços, e o **Nginx**.