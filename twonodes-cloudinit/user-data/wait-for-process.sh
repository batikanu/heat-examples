#!/bin/bash
# wait-for-postgres.sh

set -e

#host="$1"
#shift
#cmd="$@"
docker run --rm -i --net=host --name oscm-glassfish servicecatalog/Postgres

until $(docker inspect -f {{.State.Running}} oscm-postgres); do
    printf 'Postgres is unavailable - sleeping \n'
    sleep 3
done

docker run --rm -i --net=host --name oscm-glassfish servicecatalog/glassfish

#until $POSTGRES_CHECK == *"OK"*; do
  #>&2 echo "Postgres is unavailable - sleeping"
  #sleep 1
#done

#>&2 echo "Postgres is up - executing command"
#exec $cmd
