#!/bin/bash
#java
JAVA_ARCHIVE=jdk-7u79-linux-x64.tar.gz

#spark
SPARK_VERSION=spark-1.4.0
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop2.6.tgz
SPARK_MIRROR_DOWNLOAD=../modules/spark-1.1.1-bin-hadoop2.4.tgz
SPARK_RES_DIR=/vagrant/modules/spark
SPARK_CONF_DIR=/usr/local/spark/conf
#ssh
SSH_RES_DIR=/vagrant/modules/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

function resourceExists {
	FILE=/vagrant/modules/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

#echo "common loaded"
