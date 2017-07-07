#/bin/sh

. /opt/indico/env/bin/activate

until pg_isready
do
        echo "."
            sleep 1
        done
sleep 2

psql -c 'SELECT * FROM events.events'

if [ $? -eq 1 ]; then
    echo 'Preparing DB...'
    echo 'CREATE EXTENSION unaccent;' | psql
    echo 'CREATE EXTENSION pg_trgm;' | psql
    indico db prepare
fi

echo 'Starting Indico...'
uwsgi --ini /opt/indico/indico.ini
