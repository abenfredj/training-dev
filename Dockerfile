FROM ubuntu:20.04
#ENV MARIADB_ROOT_PASSWORD=myPassword
RUN apt-get update 
RUN apt-get install apt-transport-https curl -y
RUN curl -o /etc/apt/trusted.gpg.d/mariadb_release_signing_key.asc 'https://mariadb.org/mariadb_release_signing_key.asc'
RUN sh -c "echo 'deb https://mirror.marwan.ma/mariadb/repo/10.6/ubuntu focal main' >>/etc/apt/sources.list"
RUN apt-get update
RUN apt-get install mariadb-server -y
COPY ./my.cnf /etc/mysql/my.cnf
RUN  mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

EXPOSE 3306 , 6600
CMD ["mysqld", "--user", "mysql"]
