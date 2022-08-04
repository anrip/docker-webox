#!/bin/sh -ex
#

build() {

    tag=${1:-nginx}

    name=${2:-$tag}

    if [ ! -f $tag.tar.gz ]; then
        wget https://team.vmlu.com/git/open/webox-docker/archive/$tag.tar.gz
    fi

    tar -xvf $tag.tar.gz

    docker build -t vmlu/webox:$name webox-docker

    docker push vmlu/webox:$name

    rm -rf webox-docker

}

rm -f *.tar.gz

build nginx

build nginx-php5.6
build nginx-php5.6 nginx-php5

build nginx-php7.3

build nginx-php7.4
build nginx-php7.4 nginx-php
build nginx-php7.4 nginx-php7

build nginx-php8.0
build nginx-php8.0 nginx-php8

build edge
build master latest