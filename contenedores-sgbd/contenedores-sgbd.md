# Contenedores de Sistemas Gestores de Base de Datos
![ImagenDocker](./img/docker-image2.png)

## Comandos Docker con Descripción 
| Comando | Descripción |
| :--- | :--- |
| **docker --version**| _Verifica la versión de docker_ |
| **docker pull nombre_imagen** | _Descarga una imagen de Docker Hub_ [DockerHub](https://hub.docker.com/) |
| **docker images** | _Visualiza las imagenes_ |
| **docker run** | _crea un contenedor_ |
| **docker ps** | _visualiza todos los contenedores en ejecución_ |
| **docker container ls** | _visualiza todos los contenedores en ejecución_ |
| **docker ps -a** | _visualiza todos los contenedores en ejecución y no en ejecución_ |
| **docker container ls -a** | _visualiza todos los contenedores en ejecución y no en ejecución_ |
| **docker stop nombre_contenedor o ID** | _Detiene un contenedor_ |
| **docker start nombre_contenedor o ID** | _Incia un contenedor_ |
| **docker rm nombre_contenedor o ID** | _Elimina un contenedor que no esta en ejecución_ |
| **docker rm -f nombre_contenedor o ID** | _Elimina un contenedor que esta en ejecución_ |
| **docker volume ls** | _Lista los volumes que tiene docker_ |
| **docker volume create nombre_volumen** | _Crea un volumen_ |
| **docker volume rm nombre_volumen** | _Elimina un volumen_ |




## Comandos de Contenedores de SGBD

```
docker pull docker/getting-started
```

### Contenedor de tutorial de docker

```
docker run -d --name tutorial-docker -p 80:80 docker/getting-started:latest 
o
docker run -d --name tutorial-docker -p 80:80 d7933

```
### Contenedor de MariaDB Sin Volumen

```
docker run -d --name server-MariaDBG3 -p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345  8763a
```

### Contenedor de MariaDB Con Volumen

```
docker run -d --name server-MariaDBG3 \
-p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 \
-v vol-mariadbg3:/var/lib/mysql 8763a
```

### Contenedor de Postgres Con Volumen

```docker
docker run -d --name server-postgresg3 \
-e POSTGRES_PASSWORD=123456 \
-p 5456:5432 -v vol-postgresg3:/var/lib/postgresql/data \
bbb88
```
