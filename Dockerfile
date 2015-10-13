FROM postgres:latest
MAINTAINER Jon Miller <jondelmil@gmail.com>

# Add authentication initialization file
COPY authentication.sh /docker-entrypoint-initdb.d/authentication.sh

# Add bitbucket database initialization file
COPY bitbucket.sh /docker-entrypoint-initdb.d/bitbucket.sh

# Default configuration
ENV BITBUCKET_DB_NAME bitbucketdb
ENV BITBUCKET_DB_USER bitbucket
ENV BITBUCKET_DB_PASS password
