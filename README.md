# Shiny Server for Openshift online.

Shiny Server is a server program that makes <a href="http://rstudio.com/shiny" target="_blank">Shiny</a> applications available over the web.
This repository forks the opensource version and make proper modifications in other to get a working shiny server on openshift. Also a Dockerfile, based on openshift's redhat, is provided as an vm alternative.

## Features

* Original Project readme can be found [here](https://github.com/ekergy/shiny-server/blob/master/README_original)
* This fork intents the working point fo set and use the shiny server as a Openshift Online App

## Known limitations
* The openshift gears don't have X11 available so standard R aren't usable.
  This means that:
  * Basic examples generate plot using X11 and/or cairo so they don't work.
  * Just use the cool web plot plugins that are free and available in R or as CDN.

## Installing

* You must install R. In this repo we used the openshift quickstart found <a href="https://github.com/openshift-quickstart/r-quickstart" target="_blank">here</a>. In this repository we provide the minimal [script](https://github.com/ekergy/shiny-server/blob/master/R/deploy_R.sh) to get R working.
