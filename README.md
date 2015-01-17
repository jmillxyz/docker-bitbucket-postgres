# docker-stash-postgres

A PostgreSQL container ready to be used with [docker-stash](https://github.com/ahaasler/docker-stash "A Docker image for Stash").

## Usage

1. Create and name the database container:

	```bash
docker run --name stash-postgres -d ahaasler/stash-postgres
	```

2. Use it in the Stash container:

	```bash
docker run --name stash --link stash-postgres:stash-postgres -d -p 7990:7990 -p 7999:7999 ahaasler/stash
	```

3. Connect your Stash instance following the Atlassian documentation: [Connecting Stash to PostgreSQL](https://confluence.atlassian.com/display/STASH/Connecting+Stash+to+PostgreSQL#ConnectingStashtoPostgreSQL-ConnectStashtothePostgreSQLdatabase "Connecting Stash to PostgreSQL").
	* _Database Type_: PostgreSQL.
	* _Hostname_: stash-postgres (the name of the link between containers).
	* _Port_: 5432.
	* _Database name_: stashdb (or the one specified as STASH_DB_NAME).
	* _Database username_: stash (or the one specified as STASH_DB_USER).
	* _Database password_: password (or the one specified as STASH_DB_PASS).

> See [docker-stash](https://github.com/ahaasler/docker-stash "A Docker image for Stash") for more information on the stash container.

### Parameters

You can use these environment variables to configure your stash postgres instance:

* **STASH_DB_NAME:** The name of your PostgreSQL database (default: `stashdb`).
* **STASH_DB_USER:** The user for STASH to connect to the PostgreSQL server (default `stash`).
* **STASH_DB_PASS:** The password that STASH should use to authenticate with the PostgreSQL server (default `password`).

They should be passed to the `docker run` command:

```bash
docker run --name stash-postgres -d -e STASH_DB_NAME=stashdatabase -e STASH_DB_USER=stashdbuser -e STASH_DB_PASS=p455w0rd ahaasler/stash-postgres
```

## Thanks

* [Docker](https://www.docker.com/ "Docker") for this amazing container engine.
* [PostgreSQL](http://www.postgresql.org/) for this advanced database.
* [Atlassian](https://www.atlassian.com/ "Atlassian") for making great products. Also for their work on [atlassian-docker](https://bitbucket.org/atlassianlabs/atlassian-docker "atlassian-docker repo") which inspired this.
* [Azul Systems](http://www.azulsystems.com/ "Azul Systems") for their *OpenJDK* docker base image.
* And specially to you and the entire community.

## License

This image is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for the full license text.
