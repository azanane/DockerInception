FROM debian:buster

# update packages
RUN apt-get update -y 
RUN apt-get upgrade -y

# install an environment
RUN	apt-get install -y mariadb-server

# change the configuration of the server
RUN sed -i 's/bind-address/bind-address=0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tocopy/config.sh /config.sh

RUN chmod +x config.sh

ENTRYPOINT [ "/config.sh" ]
