#
# Elasticsearch Dockerfile
#
# https://github.com/cockcrow/elasticsearch
#

# Pull base image.
FROM java:latest

ENV ES_PKG_NAME elasticsearch-1.7.3

# Install Elasticsearch.
RUN \
  cd / && \
  wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

# Install plugins
RUN /elasticsearch/bin/plugin -install karmi/elasticsearch-paramedic && \
  /elasticsearch/bin/plugin -install mobz/elasticsearch-head

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
