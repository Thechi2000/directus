DIR=$(dirname $0)

docker exec -i clic-postgres psql --user directus_user directus_data < $DIR/dump.sql

# Restarts directus to reload the permission table
docker restart clic-directus

echo Restarting Directus container
