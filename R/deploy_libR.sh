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
  echo "installing Rcpp"
  # wget http://cran.es.r-project.org/src/contrib/Rcpp_0.11.6.tar.gz
  # R CMD INSTALL Rcpp_0.11.6.tar.gz
  # rm Rcpp_0.11.6.tar.gz
else
 echo "Rcpp already installed"
fi

if [ ! -d $R_HOME/lib64/R/library/devtools ]; then
  echo "installing devtools"
  # bin/Rscript -e "install.packages('devtools',contriburl = contrib.url('http://cran.r-project.org'))"
else
  echo "devtools already installed"
fi

if [ ! -d $R_HOME/lib64/R/library/shiny ]; then
  echo "installing shiny"
  # bin/Rscript -e "install.packages('shiny',contriburl = contrib.url('http://cran.r-project.org'))"
else
 echo "shiny already installed"
fi

if [ ! -d $R_HOME/lib64/R/library/rCharts ]; then
  echo "installing rCharts" 
  # bin/Rscript -e "library('devtools');install_git('https://github.com/ramnathv/rCharts.git')"
else
  echo "rCharts already installed"
fi

