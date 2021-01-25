#!/bin/bash

WORKDIR=$(dirname $0)

pushd $WORKDIR

rm -rf postgresql solr zookeeper 2>/dev/null
if [ $? -ne 0 ]; then
    sudo rm -rf postgresql solr zookeeper
fi

mkdir -p postgresql/{data,init}
mkdir -p solr/{data,configsets}
mkdir -p zookeeper/{data,datalog,logs}

chmod 0777 solr/data

cp examples/zoo.cfg.example zookeeper/zoo.cfg

popd
