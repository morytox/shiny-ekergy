
# Pagina Web para el modelado, el analisis y la explotacion de datos del Mercado Electrico
# http://priceprofor.ekergy.es/

shinyUI(fluidPage(

  column(12,
         # titulo del panel
         titlePanel("Electric Daily Market (Spain)"), align="center"),

  column(12, 
         # fechas inicial y final usadas en el graficado
         dateRangeInput('dateRange',
                        label = 'Rango de fechas:',
                        # start = as.Date("2011-1-1"), end = as.Date("2011-1-1"),
                        # start = Sys.Date(), end = Sys.Date(),
                        start = as.Date(lastDate), end = as.Date(lastDate),
                        # start = as.Date("2015-1-1"), end = as.Date("2015-1-7"),
                        language = 'es')
         ),

  
  column(12,
         # tabla resumen de estadisticas
         h5(strong("Tabla estadisticas Precio:")),
         verbatimTextOutput("summary_Precio"), align="left"),
    
  column(12,
         # tabla resumen de estadisticas
         h5(strong("Tabla estadisticas HIDRAULICA_CONVENCIONAL:")),
         verbatimTextOutput("summary_HIDRAULICA_CONVENCIONAL"), align="left"),

  column(12,
         # tabla resumen de estadisticas
         h5(strong("Tabla estadisticas HIDRAULICA_BOMBEO_PURO:")),
         verbatimTextOutput("summary_HIDRAULICA_BOMBEO_PURO"), align="left"),

  column(12,
         # tabla resumen de estadisticas
         h5(strong("Tabla estadisticas NUCLEAR:")),
         verbatimTextOutput("summary_NUCLEAR"), align="left"),

  column(12,
         # tabla resumen de estadisticas
         h5(strong("Tabla estadisticas CARBON_NACIONAL:")),
         verbatimTextOutput("summary_CARBON_NACIONAL"), align="left"),

  column(12,
         # tabla resumen de estadisticas
         h5(strong("Tabla estadisticas CARBON_IMPORTACION:")),
         verbatimTextOutput("summary_CARBON_IMPORTACION"), align="left"),
  
  column(12,
         # tabla resumen de estadisticas
         h5(strong("Tabla estadisticas CICLO_COMBINADO:")),
         verbatimTextOutput("summary_CICLO_COMBINADO"), align="left"),

  column(12,
         # tabla resumen de estadisticas
         h5(strong("Tabla estadisticas REGIMEN_ESPECIAL_A_MERCADO:")),
         verbatimTextOutput("summary_REGIMEN_ESPECIAL_A_MERCADO"), align="left"),

  column(12,
         # tabla resumen de estadisticas
         h5(strong("Tabla estadisticas TOTAL_REGIMEN_ORDINARIO_CON_PRIMA:")),
         verbatimTextOutput("summary_TOTAL_REGIMEN_ORDINARIO_CON_PRIMA"), align="left"),
  
#   column(12, dataTableOutput("cor")),

# seccion del panel principal
  mainPanel()
))
