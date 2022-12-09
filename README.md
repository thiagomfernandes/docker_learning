# networks/externa

Cria uma imagem docker, baseado em python, com um pqueno app flask na porta 5000,
que consulta um usuario randomico através da api https://randomuser.me/api usando requests do python
abra o terminal na pasta networks/externa e digite os comandos:
- docker build -t flasknetext . 
- docker run -d -p 5000:5000 --name flask --rm flasknetext
Pronto, basta acessar o app através da url http://127.0.0.1:5000/


# networks/host

Cria uma imagem docker, baseado em python, com um pqueno app flask na porta 5001,
que consulta um usuario randomico através da api https://randomuser.me/api usando requests do python
abra o terminal na pasta networks/host e digite os comandos:
- docker build -t flasknethost . 
- docker run -d -p 5001:5001 --name flaskhost --rm flasknethost
Pronto, basta acessar o app através da url http://127.0.0.1:5000/createuser para consultar um usuario randomico na api e salvar o nome deste usuario no banco de dados da máquina host, usando o recurso "host.docker.internal" para resolver o ip do host onde deve estar o mysql server.

# networks/containers

Cria uma imagem docker, baseado em mysql,e executa um arquivo de schema para criar o banco de dados (schema.sql) para receber os dados de usuários.
abra o terminal na pasta networks/containers/mysql e digite os comandos:
- docker build -t flaskmysql . 
- docker network create flasknetwork
- docker run -d -p 3306:3306 --name flaskmysqlcontainer --rm --network flasknetwork -e MYSQL_ALLOW_EMPTY_PASSWORD=True flaskmysql

Cria uma imagem docker, baseado em python, com um pqueno app flask na porta 5002,
que consulta um usuario randomico através da api https://randomuser.me/api usando requests do python
abra o terminal na pasta networks/containers/flask e digite os comandos:
- docker build -t flaskapi
- docker run -it -p 5002:5002 --name flaskapicontainer --rm --network flasknetwork flaskapi       

Pronto, basta acessar o app através da url http://127.0.0.1:5002/createuser para consultar um usuario randomico na api e salvar o nome deste usuario no banco de dados do container flaskmysqlcontainer, usando o nome do container mysql 'flaskmysqlcontainer' para resolver o ip do container onde está rodando o mysql server.