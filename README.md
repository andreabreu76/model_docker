# model_docker

Este é um conjunto de instruções para montagem de um ambiente de microservico docker. Neste há arquivos que irão montar um ambiente de desenvolvimento PHP ou NODE

## docker-compose.yml

Resonsavel principal pelo container onde agraga instruções de como as imagens docker serão executadas em conjunto proporcionando o ambiente.

## app.dockerfile

Arquivo de controle da imagem que fará parte do container rodando a APLICAÇAO. Neste a imagem é adquirida do Docker Hub e personalizada de acordo com as instruções para compor parte do nosso container.

> PHP 7.4.11 FPM
> 
> NODE.js 14.14
> 
> Composer 1.10

## web.dockerfile

Arquivo de controle da imagem que fará parte do container rodando o serviço HTTP/HTTPS ou WEB. Fara chamada direta da imagem de APLICAÇÂO para rodar os scripts de desenvolvimento.

> Nginx Latest Stable

Arquivo vhost.conf é chamado por este dockerfile para que juntamente com o controle da Aplicação tenha parametros para executar scripts PHP.

## db.dockerfile

Arquivo de controle da imagem que fará parte do container rodando serviço de Banco de Dados. Servirá de DB para o proprio ambiente.

> MariaDB 10.5

# Execução / Uso

## Projeto PHP 8.1 / Laravel

Após o download, renomeie a pasta model_docker para um nome que represente melhor seu projeto.

```bash
mv model_docker meuprojeto
```

Feito isso, apague as informações GIT atual (do model_docker) e inicie seu proprio GIT. 

```bash
rm -rf .git/ && git init
```

Configure seu ambiente editanto o arquivo .env com os parametros necessarios

```bash
nano .env
```

Caso tenha sucesso digite `docker ps` para obter a listagem de imagens em execução. Feito isso execute:

Para iniciar um projeto Laravel.

```bash
 docker run --rm -v $(pwd):/app composer create-project --prefer-dist laravel/laravel src
```

```bash
 sudo chown -R $USER:$USER src/
```

```bash
cd src/
```

```bash
chmod -R 777 storage/
```

```bash
docker exec -it meuprojeto_app_1 php artisan optimize
```

Inicie o container.

```bash
cd ../
```

```bash
docker-compose up --build -d
```

Basta testar o projeto no navegador http://localhost:8088.


## Projeto NODE.js 8.11 / Express

Para iniciar um projeto Node.js

```bash
docker exec -it meuprojeto_app_1 npm init src
```

```bash
cd src/
```

```bash
docker exec -it meuprojeto_app_1 npm i npm -g
```

```bash
docker exec -it meuprojeto_app_1 npm run watch
```
