## Elasticsearch Dockerfile

** Forked from [dockerfile/elasticsearch](https://github.com/dockerfile/elasticsearch) **

This repository contains **Dockerfile** of [Elasticsearch](http://www.elasticsearch.org/) for [Docker](https://www.docker.com/)'s [automated build](https://hub.docker.com/r/cockcrow/elasticsearch/) published to the public [Docker Hub Registry](https://hub.docker.com).


### Base Docker Image

* [java:latest](https://hub.docker.com/_/java/)

### Elasticsearch Plugins Installed

* [Elasticsearch Paramedic](https://github.com/karmi/elasticsearch-paramedic)

* [Elasticsearch Head](https://github.com/mobz/elasticsearch-head)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/cockcrow/elasticsearch/) from public [Docker Hub Registry](https://hub.docker.com): `docker pull cockcrow/elasticsearch`

   (alternatively, you can build an image from Dockerfile: `docker build -t="<hub-user>/elasticsearch" github.com/cockcrow/elasticsearch`)


### Usage

    docker run -d -p 9200:9200 -p 9300:9300 cockcrow/elasticsearch

#### Attach persistent/shared directories

  1. Create a mountable data directory `<data-dir>` on the host.

  2. Create Elasticsearch config file at `<data-dir>/elasticsearch.yml`.

    ```yml
    path:
      data: /data/data
      work: /data/work
      logs: /data/logs
    ```

  3. Start a container by mounting data directory and specifying the custom configuration file:

    ```sh
    docker run -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/data cockcrow/elasticsearch /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml
    ```

After few seconds, open `http://<host>:9200` to see the result.
