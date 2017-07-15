#
# run.sh
# invoke headless stroom
#

THIS_DIR=`pwd`
if [ ! -f ${THIS_DIR}/stroom.war ];
then
    echo "Downloading latest WAR"
    mkdir ${THIS_DIR}/download
    wget -P ${THIS_DIR}/download https://github.com/gchq/stroom/releases/download/v5.0-beta.40/stroom-app-distribution-5.0-beta.40-bin.zip
    unzip -d ${THIS_DIR}/download ${THIS_DIR}/download/stroom-app-*.zip
    cp ${THIS_DIR}/download/stroom-app/lib/stroom*.war ${THIS_DIR}/stroom.war
fi

${THIS_DIR}/stroom.sh
