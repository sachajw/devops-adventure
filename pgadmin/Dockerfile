FROM dpage/pgadmin4

ARG TAG=kubevisor-pgadmin

# Installing required tools
RUN apt-get update -y \
    apt-get install -y \
    curl gnupg lsb-release less

# Install the public key for the repository (if not done previously):
COPY pgadmin/packages_pgadmin_org.pub /var/tmp/packages_pgadmin_org.pub
RUN cat /var/tmp/packages_pgadmin_org.pub |  apt-key add \
    sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Install for both desktop and web modes:
RUN apt install -y pgadmin4 \
# Install for web mode only:
    apt install -y pgadmin4-web

RUN  mkdir -p /var/log/pgadmin
COPY pgadmin/cacert.pem /usr/lib/ssl/cert.pem
COPY pgadmin/config.py /usr/pgadmin4/web/config.py
COPY pgadmin/oauth2.py /usr/pgadmin4/web/pgadmin/authenticate/oauth2.py
COPY pgadmin/pgAdmin4.wsgi* /usr/pgadmin4/web/
COPY pgadmin/web.sh /usr/pgadmin4/bin/setup-web.sh
COPY pgadmin/init.sh /init.sh
RUN  chmod 755 /init.sh /usr/pgadmin4/bin/setup-web.sh && sed -i 's~Listen 80~Listen 8080~g' /etc/apache2/ports.conf \
    && sed -i 's~Listen 443~Listen 8443~g' /etc/apache2/ports.conf \
    && rm -rf /var/run/apache2/* /run/apache2/* /tmp/apache2* /var/lock/apache* \
    && chown allianz -Rf /var/www/html /var/log/apache2/ \
    && sed -i 's~APACHE_RUN_USER=www-data~APACHE_RUN_USER=apache~g' /etc/apache2/envvars \
    && mkdir -p /var/lib/pgadmin && chmod -R 777 /var/lib/pgadmin \
    && chown -Rf allianz /usr/pgadmin4 /var/lib/pgadmin /var/log/pgadmin/ /etc/apache2 /var/lib/apache2/ /var/run/apache2/

WORKDIR /usr/pgadmin4/web/

# just default passwords, will be overriden by vault credentials
ENV PGADMIN_SETUP_EMAIL=humptydumpty@ortelius.com
ENV PGADMIN_SETUP_PASSWORD=adminpass123

CMD [ "/init.sh", "-d" ]
