
# Pagina Web para el modelado, el analisis y la explotacion de datos del Mercado Electrico
# http://priceprofor.ekergy.es/

shinyUI(fluidPage(

  column(12,
         # titulo del panel
         titlePanel("Electric Daily Market (Spain)"), align="center"),

  column(8, 
         # lista de las variables input
         selectInput("varInput", "Seleccionar una variable:", 
                        choices=colnames(omiemi)),
         # fechas inicial y final usadas en el graficado
         dateRangeInput('dateRange',
                        label = 'Rango de fechas:',
                        # start = as.Date("2011-1-1"), end = as.Date("2011-1-1"),
                        # start = Sys.Date(), end = Sys.Date(),
                        start = as.Date(lastDate), end = as.Date(lastDate),
                        # start = as.Date("2015-1-1"), end = as.Date("2015-1-7"),
                        language = 'es')
         ),
  column(4,
         # tabla resumen de estadisticas
         h5(strong("Tabla estadisticas basicas:")),
         verbatimTextOutput("summary"), align="right"),
  
  
  column(12,
         # nota de aviso para hacer zoom
         "Pinch the chart to zoom in", align="right"),
  
  # grafica a mostrar y libreria empleada
  showOutput("highstock", "highcharts"),
  
  # seccion del panel principal
  mainPanel()
))
