FROM postgres:alpine

ADD /postgres/migrations/1_schema.sql /docker-entrypoint-initdb.d
ADD /postgres/migrations/2_data.sql /docker-entrypoint-initdb.d

RUN chmod a+r /docker-entrypoint-initdb.d/*
