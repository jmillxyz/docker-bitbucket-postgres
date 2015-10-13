# docker-bitbucket-postgres

A PostgreSQL container ready to be used with [docker-bitbucket](https://github.com/jondelmil/docker-bitbucket "A Docker image for Bitbucket").

## Usage

1. Create and name the database container:

	```bash
docker run --name bitbucket-postgres -d jondelmil/docker-bitbucket-postgres
	```

2. Use it in the Bitbucket Server container:

	```bash
docker run --name bitbucket --link bitbucket-postgres:bitbucket-postgres -d -p 7990:7990 -p 7999:7999 jondelmil/docker-bitbucket
	```

3. Connect your Bitbucket Server instance following the Atlassian documentation: [Connecting Bitbucket Server to PostgreSQL](https://confluence.atlassian.com/bitbucketserver/connecting-bitbucket-server-to-postgresql-776640389.html "Connecting Bitbucket Server to PostgreSQL").
	* _Database Type_: PostgreSQL.
	* _Hostname_: bitbucket-postgres (the name of the link between containers).
	* _Port_: 5432.
	* _Database name_: bitbucketdb (or the one specified as BITBUCKET_DB_NAME).
	* _Database username_: bitbucket (or the one specified as BITBUCKET_DB_USER).
	* _Database password_: password (or the one specified as BITBUCKET_DB_PASS).

> See [docker-bitbucket](https://github.com/jondelmil/docker-bitbucket "A Docker image for Bitbucket") for more information on the bitbucket container.

### Parameters

You can use these environment variables to configure your Bitbucket Server Postgres instance:

* **BITBUCKET_DB_NAME:** The name of your PostgreSQL database (default: `bitbucketdb`).
* **BITBUCKET_DB_USER:** The user for BITBUCKET to connect to the PostgreSQL server (default `bitbucket`).
* **BITBUCKET_DB_PASS:** The password that BITBUCKET should use to authenticate with the PostgreSQL server (default `password`).

They should be passed to the `docker run` command:

```bash
docker run --name bitbucket-postgres -d -e BITBUCKET_DB_NAME=bitbucketdatabase -e BITBUCKET_DB_USER=bitbucketdbuser -e BITBUCKET_DB_PASS=p455w0rd jondelmil/docker-bitbucket-postgres
```

## Thanks

* [Docker](https://www.docker.com/ "Docker") for this amazing container engine.
* [PostgreSQL](http://www.postgresql.org/) for this advanced database.
* [Atlassian](https://www.atlassian.com/ "Atlassian") for making great products. Also for their work on [atlassian-docker](https://bitbucket.org/atlassianlabs/atlassian-docker "atlassian-docker repo") which inspired this.
* [Azul Systems](http://www.azulsystems.com/ "Azul Systems") for their *OpenJDK* docker base image.
* And specially to you and the entire community.

## License

This image is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for the full license text.
