#!/bin/bash
#
# stroom.sh
# invoke headless stroom
#

ID=`id -u`

WORKING_DIR=/tmp/headless-stroom-${ID}
THIS_DIR=`pwd`
rm -rf ${WORKING_DIR}
mkdir ${WORKING_DIR}
STROOM_WAR=stroom.war
unzip -j -o $STROOM_WAR *.jar -d ${WORKING_DIR}

TEMP_DIR=${THIS_DIR}/tmp
rm -rf ${TEMP_DIR}/*

java -cp ${THIS_DIR}/lib:${THIS_DIR}/lib/*:${STROOM_WAR}:${WORKING_DIR}/* -Dlog4j.configuration=file:///${THIS_DIR}/lib/log4j.xml stroom.headless.Headless input=$THIS_DIR/input/repo output=$THIS_DIR/output/RESULT config=$THIS_DIR/input/config.zip tmp=$TEMP_DIR
