# Shiny Server for Openshift online.

Shiny Server is a server program that makes [Shiny](http://rstudio.com/shiny) applications available over the web.

## Features

* Original Project readme can be found [here](README_original.md)
* This fork intents the working point fo set and use the shiny server as a Openshift Online App.

## Known limitations
* The openshift gears don't have X11 available so standard R aren'ty usable.
  This means that:
  * Basic examples generate plot using X11 and/or cairo so they don't work.
  * Just use the cool web plot plugins that are free and available in R or as CDN.

## Installing

* You must install R. In this repo we used the openshift quickstart found [here](https://github.com/openshift-quickstart/r-quickstart). In this repository we provide the minimal [script]() to get R working.