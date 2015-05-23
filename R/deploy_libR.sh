#!/bin/bash

R_HOME="${OPENSHIFT_DATA_DIR}r"
R_VERSION="3.1.2"


mkdir -p $R_HOME

cd $R_HOME

if [ -e /sandbox/r ]; then
  unlink /sandbox/r
fi

ln -s `pwd` /sandbox/r

if [ ! -d $R_HOME/lib64/R/library/Rcpp ]; then
  echo -ne "installing Rcpp ..\r"
  wget http://cran.es.r-project.org/src/contrib/Rcpp_0.11.6.tar.gz > $OPENSHIFT_LOG_DIR/installRcpp.log 2>&1
  bin/R CMD INSTALL Rcpp_0.11.6.tar.gz >> $OPENSHIFT_LOG_DIR/installRcpp.log 2>&1
  echo -ne ". done\r"
  echo '\n'
  rm Rcpp_0.11.6.tar.gz
else
 echo "Rcpp already installed"
fi

if [ ! -d $R_HOME/lib64/R/library/devtools ]; then
  echo -ne "installing devtools ..\r"
  bin/Rscript -e "install.packages('devtools',contriburl = contrib.url('http://cran.r-project.org'))" > $OPENSHIFT_LOG_DIR/installRdevtools.log 2>&1
  echo -ne ". done\r"
  echo '\n'
else
  echo -ne "devtools already installed\r"
  echo '\n'
fi

if [ ! -d $R_HOME/lib64/R/library/shiny ]; then
  echo -ne "installing shiny ..\r"
  bin/Rscript -e "install.packages('shiny',contriburl = contrib.url('http://cran.r-project.org'))" > $OPENSHIFT_LOG_DIR/installRshiny.log 2>&1
  echo -ne ". done"
  echo '\n'
else
 echo -ne "shiny already installed\r"
 echo '\n'
fi

if [ ! -d $R_HOME/lib64/R/library/plyr ]; then
  echo "installing plyr"
  wget http://cran.rstudio.com/src/contrib/plyr_1.8.2.tar.gz > $OPENSHIFT_LOG_DIR/installRplyr.log 2>&1
  bin/R CMD INSTALL plyr_1.8.2.tar.gz >> $OPENSHIFT_LOG_DIR/installRplyr.log 2>&1
  echo "done"
  rm plyr_1.8.2.tar.gz
else
 echo "plyr already installed"
fi

if [ ! -d $R_HOME/lib64/R/library/rCharts ]; then
  echo -ne "installing rCharts\r" 
  bin/Rscript -e "library('devtools');install_git('https://github.com/ramnathv/rCharts.git')" > $OPENSHIFT_LOG_DIR/installRcharts.log 2>&1
  echo -ne "done"
  echo '\n'
else
  echo -ne "rCharts already installed\r"
  echo '\n'
fi

