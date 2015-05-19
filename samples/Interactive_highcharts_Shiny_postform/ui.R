
# shiny ui
shinyUI(fluidPage(

  # titulo del panel
  column(7, titlePanel("Mercado Electrico"), align="right"),

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
                 language = 'es'),
  
  # nota de aviso para hacer zoom
  column(12, "Pinch the chart to zoom in", align="right"),
  
  # grafica a mostrar y libreria empleada
  showOutput("highstock", "highcharts"),

  # tabla resumen de estadisticas
  h5(strong("Tabla estadisticas basicas:")),
  verbatimTextOutput("summary"),
  
  # seccion del panel principal
  mainPanel()
))
