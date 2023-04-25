FROM geopython/pygeoapi:latest

ADD pygeoapi/census.config.yml /pygeoapi/local.config.yml
ADD pygeoapi/postgresql.py /pygeoapi/pygeoapi/provider/postgresql.py
ADD pygeoapi/_base.html  /pygeoapi/pygeoapi/templates/_base.html
