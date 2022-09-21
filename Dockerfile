FROM gvenzl/oracle-xe:21-slim

USER root

RUN mkdir /usr/dbuserdata
RUN mkdir -p /container-entrypoint-initdb.d

RUN chown oracle:dba /usr/dbuserdata

COPY db_init/init.sql /container-entrypoint-initdb.d

USER oracle
