FROM geopython/pygeoapi:latest

# Add modifications
ADD ./postgresql.py /pygeoapi/pygeoapi/provider/postgresql.py
ADD ./intersect.py /pygeoapi/pygeoapi/process/intersect.py
ADD ./_base.html  /pygeoapi/pygeoapi/templates/_base.html
ADD ./plugin.py /pygeoapi/pygeoapi/plugin.py

# Add pygeoapi configuration
ADD ./census.config.yml /pygeoapi/local.config.yml
