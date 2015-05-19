
# instruccion para poner en funcionamiento la aplicacion
# runApp("/home/david/workspace/shinyrcharts/samples/Interactive_highcharts_Shiny_postform/")
# runApp("/home/david/workspace/shinyrcharts/samples/Interactive_highcharts_Shiny_postform/",port=12345,launch.browser=FALSE)
# http://shinyrcharts-ekergydavid.rhcloud.com/samples/Interactive_highcharts_Shiny_postform/

library(RCurl)
library(RJSONIO)
library(shiny)
library(rCharts)

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

  # genero la variable "time" que es la hora en formato "HH"
  for (i in 1:length(omiemi$Hora)){
    if (omiemi$Hora[i]<=9) {
      omiemi$time[i] <- paste(0, omiemi$Hora[i], sep="")
    }
    else{
      omiemi$time[i]<-omiemi$Hora[i]
    } 
  }
  
  # genero la variable "date" que es la fecha en formato "YY-mm-dd HH:MM:SS"
  Hora <- paste(omiemi$time, ":00:00", sep="")
  omiemi$date <- as.POSIXct(paste(omiemi$Fecha, Hora, sep=" "),"GMT")
  
  # elimino de la lista las variables "Fecha" y "Hora"
  omiemi <- omiemi[ ,!colnames(omiemi)=="Fecha"]
  omiemi <- omiemi[ ,!colnames(omiemi)=="Hora"]

  return(omiemi);
 }

omiemi <- omiefunc(lastDate,lastDate)
