
# paquetes de instalacion de rCharts y shiny
install.packages("devtools")
require(devtools)
install_git('rCharts', 'ramnathv')
install.packages("shiny")
# install.packages("rCharts")

# fichero y librerias necesarios para ejecutar runApp

# fecha de datos
urlStatus <- "http://priceprofor.ekergy.es/omieinfosys/status"
x <- getURLContent(urlStatus)
y <- fromJSON(x)
z <- y$StudyDataMIBEL$endrecdate
lastDate <- as.character(as.Date(z))

# fichero de datos
omiefunc <- function (fechainicial,fechafinal) {
  urlData <- "http://priceprofor.ekergy.es/omieinfosys/DataFileGenerator";
  w <- postForm(urlData,
                # .opts = list(postfields = toJSON(list(fechaini = "2011-1-1", fechafin = "2015-1-1", market = "ES")),
                # .opts = list(postfields = toJSON(list(fechaini = "2011-1-1", fechafin = as.character(Sys.Date()), market = "ES")),
                # .opts = list(postfields = toJSON(list(fechaini = "2011-1-1", fechafin = lastDate, market = "ES")),
                # .opts = list(postfields = toJSON(list(fechaini = "2015-1-1", fechafin = lastDate, market = "ES")),
                .opts = list(postfields = toJSON(list(fechaini = fechainicial, fechafin = fechafinal , market = "ES")),
                             httpheader = c('Content-Type' = 'application/json', Accept = 'application/json')
                ));
  omiemi <- read.csv(text=w, sep = ";",  header=TRUE);

# librerias
library(shiny)
library(rCharts)
# runApp("R/Interactive_highcharts_Shiny_test")
