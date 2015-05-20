#!/bin/bash

R_HOME="${OPENSHIFT_DATA_DIR}r"
R_VERSION="3.1.2"

mkdir -p $R_HOME

cd $R_HOME

if [ -e /sandbox/r ]; then
  unlink /sandbox/r
fi

ln -s `pwd` /sandbox/r

if [ -e "${OPENSHIFT_REPO_DIR}node_modules/.bin/R" ]; then
  unlink ${OPENSHIFT_REPO_DIR}node_modules/.bin/R
fi

ln "${OPENSHIFT_DATA_DIR}r/bin/R" -s "${OPENSHIFT_REPO_DIR}node_modules/.bin/R"

if [ ! -f $R_HOME/bin/R ]; then

  if [ ! -e "R-${R_VERSION}.tar.gz" ]; then
    wget http://cran.cnr.berkeley.edu/src/base/R-3/R-${R_VERSION}.tar.gz
  fi

  if [ -e "R-${R_VERSION}" ]; then
    rm -rf "R-${R_VERSION}"
  fi

  tar -xf R-${R_VERSION}.tar.gz

  cd "R-${R_VERSION}"

  ./configure --prefix=/sandbox/r --with-recommended-packages=no > $OPENSHIFT_LOG_DIR/installR.log 2>&1
  echo "R configure done"
  make --silent >> $OPENSHIFT_LOG_DIR/installR.log 2>&1
  echo "R make done"
  make install >> $OPENSHIFT_LOG_DIR/installR.log 2>&1
  echo "R make install done"
  rm -rf "R-${R_VERSION}"
else
  echo "R already installed in the system"
fi

cd ..

