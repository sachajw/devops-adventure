#!/bin/bash

# Sourcing secrets from vault into env-vars
if [ "${VAULT_INIT_SCRIPT}x" != "x" ]; then
    source ${VAULT_INIT_SCRIPT}
fi

# making env vars available for pgadmin wsgi
envsubst < /usr/pgadmin4/web/pgAdmin4.wsgi.template > /usr/pgadmin4/web/pgAdmin4.wsgi

# Starting application
/usr/pgadmin4/bin/setup-web.sh --yes


# Keeping the od up ;-)  and forwarding logs to elasticsearch and  argocd, Helps in troubleshooting
# symlink to /proc/self/fd/1 didnt help here somehow :(
if [[ $1 == "-d" ]]; then
  while true; do tail -f /var/log/apache2/*.log /var/log/pgadmin/*.log && sleep 1000; done
fi

