# Directus

Directus is the content management system used for the website, as well as a few other services. It is ran in a separate Docker container. The schema of the data it manages is stored on the [infrastructure repo](https://github.com/clicepfl/clic-infra).

## Development

> [!IMPORTANT]
> If you are running directus as part of another service, the shell script will be located in the directus submodule, or as aliases in the `npm run ---`. The command to boot the instance will also be different, see [this document](../README.md).

### Starting the instance

First, use `docker compose up` to boot up a local instance. Then, you can import the data schema using `sh load.sh` and populate it using sample data with `sh populate.sh`. You only need to do this once, or if you have deleted Directus' data volume.

You can access the admin panel at <http://localhost/directus> (username: `clic@epfl.ch`, password: `1234`). There, you can update the data, or modify the schema (see below).

### Modifying the schema

If you wish to change the schema, you can do it on your local instance admin panel, then export it using `sh save.sh`. It will create a `snapshot.yaml` file in the `directus/` folder. You should then upload this file to the [infrastructure repo](https://github.com/clicepfl/clic-infra) through a PR. You will also need to commit `app/src/types/schema.d.ts` and you may add aliases for useful types in `app/src/types/aliases.ts`.

You may also want to update the sample data: the files are automatically saved in `directus/uploads/`, and you can generate a dump of Directus' database using `sh save-data.sh`, which will write into `directus/new-dump.sql`. Then, copy the relevant insertions in the `directus/dump.sql` (take care of the order, to avoid constraint error during populate).
