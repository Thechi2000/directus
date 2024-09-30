DIR=$(dirname $0)

docker exec -it clic-postgres pg_dump -U directus_user --column-inserts --data-only directus_data > $DIR/new-dump.sql
echo "[INFO]: Database dump saved at \"$DIR/new-dump.sql\""
echo "[INFO]: Please make sure to only copy the relevant inserts into \"$DIR/dump.sql\""