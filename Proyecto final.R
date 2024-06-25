####LIBRERIAS####
library(plotly)
library(httr)
library(shiny)
library(shinydashboard)
library(esquisse)
library(tidyverse)
library(DT)

####PROCESANDO DATA########

####GRAFICOS####
####CALCULOS ESTADISTICOS####
#####DASHBOARD
#DASHBOARD
####DASBOARD PAGE####
ui<-dashboardPage(title="TRABAJO FINAL DE COMPUTACION 2", skin= "purple",
                  dashboardHeader(title="Contenido",
                                  dropdownMenu(type="notifications",
                                               notificationItem(text="Trabajo hecho con fines academicos")
                                               
                                  ),
                                  dropdownMenu(type="tasks",
                                               taskItem(value=58.82,
                                                        text="Porcentaje del BD usado",
                                                        color="blue")
                                  )
                                  ####DASHBOARD SIDEBAR####                                  
                  ),
                  dashboardSidebar(
                    sidebarMenu(id="sidebarID",
                                menuItem("Portada", tabName = "Portada"),
                                menuItem("Base de datos", tabName = "Datos"),
                                menuItem("Introduccion", tabName = "Introduccion"),
                                menuItem("Preguntas de investigacion", tabName = "Preguntas de investigacion"),
                                menuItem("Objetivos", tabName = "Objetivos"),
                                menuItem("Planteamiento", tabName = "PlanteamientO"),
                                menuItem("Estadisticas",id = "chartsID",
                                         menuSubItem("1er grafico", tabName = "grafico", icon = shiny::icon("eye")),
                                         menuSubItem("2do grafico", tabName = "grafico4", icon =icon("eye")),
                                         menuSubItem("3er grafico", tabName = "grafico5", icon =icon("eye")),
                                         menuSubItem("4to grafico", tabName = "grafico2", icon =icon("eye")),
                                         menuSubItem("5to grafico", tabName = "grafico6", icon =icon("eye")),
                                         menuSubItem("6to grafico", tabName = "grafico3", icon =icon("eye")),
                                         menuSubItem("7mo grafico", tabName = "", icon = icon("eye")),
                                         menuSubItem("8vo grafico", tabName = "", icon = icon("eye")),
                                         menuSubItem("9no grafico", tabName = "", icon = icon("eye")),
                                         menuSubItem("10mo grafico", tabName = "", icon = icon("eye"))
                                ),
                                menuItem("Resultados", tabName = "Resultados"),
                                menuItem("Conclusiones", tabName = "Conclusiones"),
                                menuItem("Bibliografía", tabName = "Bibliografía")
                    )
                    
                    #####DASHBOARD BODY####                    
                  ),
                  dashboardBody(
                    ####PORTADA####                    
                    tabItems(
                      
                      tabItem("Portada",
                              box(fluidRow(
                                column(width = 2, box(tags$image(type = "image/png", src = "logoUCV.png", height = "95px", widht = "40px"), width = 12, background = "light-blue", align = "center") ),
                                column(width = 8, box (h4("Universidad Central de Venezuela", align="center"), h4("Facultad de ciencias economicas y sociales", align="center"), 
                                                       h4("Escuela de Ciencias Estadisticas y actuariales", align="center"), h4("Materia: Computacion II", align="center"), width = 12 )),
                                column(width = 2, box(tags$image(type = "image/png", src = "logoEECA.png", height = "100px", widht = "70px"), width = 12, background = "light-blue", align = "center") )
                              ), width = 12 ,
                              style = "border: 3px solid blue"),
                              box(h1("Trabajo final de computacion 2", align="center"), h2("No se que poner aqui", align="center"), width = 12, background = "light-blue", style = "border: 3px solid blue"),
                              box(h4("Integrantes del grupo 2:", align="right"), h4("Palma Jose----C.I 31.127.315", align="right"), h4("Miguel Sanz----C.I 31.532.742", align="right"), h4("Jesús Arellano----C.I 27.566.992", align="right"),
                                  h4("Caracas, junio de 2024", align="center"),width = 12, style = "border: 3px solid blue")
                              
                      ),
                      ####INTRODUCCION####
                      tabItem("Introduccion",
                              box(title = "Introduccion", width = 12, background = "navy",
                                  h4("Según Sanchéz, B. (2013). “Los primeros juegos de pelota semejantes al tenis aparecen en la Antigua Grecia y el Imperio Romano, y alcanza su máximo auge en la Edad Media, a través del denominado “Jeu de la paume”, en Francia e Inglaterra, antes de producirse su declive en el siglo XVIII. Finalmente, la aparición del tenis moderno o “lawn tennis” a finales del siglo XIX y su expansión por Europa, 
                                 América y Australia, produjo la creación de clubes, torneos y asociaciones destinadas a la difusión y práctica de este deporte”. Parafraseando a Sánchez (2022) hasta la actualidad el tenis ha evolucionado a lo que conocemos hoy día y se ha convertido en el cuarto deporte más famoso del mundo, en consecuencia, la popularidad del mismo surge en la audiencia de este deporte la necesidad de obtener información 
                                 sobre torneos, jugadores, y estadística en general. De las razones planteadas anteriormente surge la inquietud de analizar las cualidades de los jugadores de forma general con fin de describir los resultados de interés de dicha investigación."),
                                  h4("Para efectuar la investigación se utilizaron distintas herramientas tecnológicas las cuales apoyan de forma eficiente la obtención de los resultados, entre ellas SQLite; para la gestión de los datos, Power Bi para una visualización atrayente de los datos, y el lenguaje de programación estadístico R.")
                              )
                      ),
                      ####PLANTEAMIENTO####                     
                      tabItem("PlanteamientO", 
                              fluidRow(
                                column( width = 8,
                                        box(title="Plantemiento", status = "info", width = 12,
                                            h4("El tenis es un deporte complejo que exige una combinación de habilidades físicas, técnicas y mentales. En este contexto, diversas variables pueden influir en el rendimiento de un jugador, incluyendo su edad, superficie de juego, estilo de juego, experiencia y condiciones físicas además de ello también es de interés ver cómo se comportan variables con respecto a la edad o la altura,
                                               como lo son los partidos ganados de los jugadores la cantidad de Aces realizados, dobles faltas entres otras características de interés de las cuales se pueden llegar a conclusiones que podrán estimar el comportamiento del mismo deporte que se tomó en cuenta para esta investigación, la misma tiene como objetivo analizar el comportamiento de las variables anteriormente mencionadas relevantes 
                                               en el tenis masculino de alto nivel, utilizando datos de jugadores del top 10 del ranking ATP entre los años 2000 y 2024 y tomando en cuenta además solo los torneos del Grand Slam y El Máster para el análisis de los resultados de la investigación que se realiza a consecuencia de los datos de una muestra realizada de Sackmann,(2021)."),
                                            background = "navy")),
                                column(width = 4, 
                                       box()
                                )
                                
                              )),
                      ####Preguntas de investigacion####
                      tabItem("Preguntas de investigacion",
                              box(title = "Preguntas", status = "info", widht = 12, list(
                                elemento1 = "¿Existe una correlación positiva entre el número de aces marcados y los Partidos Ganados por jugador?",
                                elemento2 = "¿Se puede predecir la cantidad de partidos ganados en función de los aces que marca un jugador?",
                                elemento3 = "¿Cuáles son las estadísticas descriptivas de los jugadores del top 10 en términos de edad, altura, país de origen y estadísticas de juego?",
                                elemento4 = "¿Existe una diferencia significativa en el rendimiento de los jugadores del top 10 según la superficie del torneo?",
                                elemento5 = "¿Según la edad cómo se comportan las cualidades de los jugadores?",
                                elemento6 = "¿Cuál es el porcentaje de partidos ganados por país y continente?",
                                elemento7 = "¿Qué país tiene más partidos ganados?"
                              ))
                      ),
                      ####BASE DE DATOS-BODY#### 
                      
                      tabItem(tabName = "Datos", 
                              DT::dataTableOutput("datos", width = "100%", height = "500px")
                      ),
                      ####ESTADISTICAS####
                      tabItem(tabName = "grafico",
                              fluidRow(
                                column(width = 10, 
                                       infoBox("2da posicion con mayor cantidad de tarjetas rojas acumuladas", h3("DF,MF/19.05%"),width =7 , color = "red"),
                                       infoBox("Posicion con mayor cantidad de tarjetas rojas acumuladas", h3("DF/28.57%"), width = 6, color = "blue"),
                                       fluidRow(column(width =10),
                                                box(title = "Grafico de barras", plotOutput("grafico"), background = "purple", width = 12)))
                              )),
                      
                      tabItem(tabName = "grafico2", 
                              fluidRow(
                                column(width = 7,
                                       box(title = "Grafico de dispersión ", plotOutput("grafico2"), background = "purple", width = 12)
                                ),
                                column(width = 5,
                                       infoBox("Tendencia de partidos para los jugadores cuando tienen tarjeta roja", h3("Desde 5 a 10 partidos jugados"), width = 12, color = "blue"),
                                       infoBox("Tendencia atipica de partidos para los jugadores cuando tienen tarjeta roja", h3("Desde 3 a 5 partidos jugados"), width = 12, color = "red")
                                )
                              )
                              
                      ),
                      tabItem(tabName = "grafico3", 
                              fluidRow(
                                column(width = 7,
                                       box(title = "Grafico de caja y bigote", plotOutput("grafico3"), background = "purple", width = 12)
                                ),
                                column(width = 5,
                                       infoBox("Similitud entre las edades de los defensores con tarjeta roja", h3("Existente"), width = 12, color = "blue"),
                                       infoBox("Segun lo planteado en la hipotesis y el grafico", h3("Es verdadera"), width = 12, color = "green"),
                                       box(title = "Nota:", 
                                           h4("Hay otros tipos de variables que podrían determinar la relación en el comportamiento de los datos, pero dichas variables no se encuentran dentro de la base de datos."),
                                           width = 12, status = "warning", background = "light-blue", collapsible = TRUE ))
                              )
                              
                      ),
                      tabItem(tabName = "grafico4",
                              fluidRow(
                                column(width = 7,
                                       box(title = "Graficos de barras", plotOutput("grafico4"), background = "purple", width = 12)
                                ),
                                column(width = 5,
                                       infoBox(title = "Intervalo de edades para DF con una tarjeta roja", h3("20-25 y 25-30"), width = 12, color = "blue" ),
                                       infoBox(title = "Tipos de jugadores dentro del intervalo", h3("Jovenes"), width = 12, color = "red"),
                                       valueBox("Hipotesis", "Para cuando los jugadores son no veteranos, es mas probabable que tengan una tarjeta roja", color= "light-blue", icon = icon("lightbulb"), width = 12)
                                )  
                              )
                      ),
                      
                      tabItem(tabName = "grafico5",
                              fluidRow(
                                column(width = 7,
                                       box(title = "Grafico de caja y bigote", plotOutput("grafico5"), background = "purple", width = 12)
                                ),
                                column(width = 5,
                                       infoBox("Posicion con 2do minimo, maximo y mediana mayores", h3("DF"), width = 12, color = "blue"),
                                       valueBox("7.62", "Promedio de faltas comprometidas para los jugadore con 1 tarjeta roja", icon = icon("chart-simple"), color = "light-blue", width = 12),
                                       box(title = "Nota:", 
                                           h4("Debido a que las faltas compromentidas tienen mayor probabilidad de ser penadas con tarjeta amarilla que las pitadas, solo se tomo este tipo de falta para el estudio"),
                                           width = 12, status = "warning", background = "light-blue", collapsible = TRUE )
                                )
                              )
                      ),
                      
                      tabItem(tabName = "grafico6",
                              fluidRow(
                                column(width = 7,
                                       box(title = "Grafico de barras", plotOutput("grafico6"), background = "purple", width = 12)
                                ),
                                column(width = 5,
                                       infoBox("País con mayor cantidad de tarjetas rojas en DF", h3("DE/Alemania"), width = 12, color = "blue"
                                       ),
                                       valueBox("1", "Cantidad de tarjetas rojas mas frecuentes por pais en DF", icon = icon("chart-simple"), color ="light-blue", width = 12)
                                )
                              )
                      ),
                      ####RESULTADOS####                              
                      tabItem("Resultados",
                              box(width = 12, status = "info", background = "navy", title = "Resultados", h4("Después de todo lo visto, tenemos los siguientes resultados:"),
                                  h4("--La primera posición con mayor cantidad de tarjetas rojas es DF, teniendo un 28.57% de las tarjetas rojas totales." ),
                                  h4("--La segunda posición con mayor cantidad de tarjetas rojas es DF,MF , teniendo un 19.05% de las tarjetas rojas totales."),
                                  h4("--Las edades de los jugadores con tarjeta roja tienen una mayor probabilidad de estar entre 20 a 30 años."),
                                  h4("--DF cuenta con un mínimo, máximo y mediana mayor a las otras posiciones, siendo que la única que la supera es la posición MF."),
                                  h4("--La mayoría de los jugadores de DF sobrepasan el promedio de faltas comprometidas para cuando tienen una tarjeta roja, el cual vendría siendo 7.62."),
                                  h4("--Para los jugadores con tarjeta roja, tienden a tener desde 5 a 10 partidos jugados, siendo valores atípicos los que tienen entre 3 a 5."),
                                  h4("--Alemania es el país con el mayor número de tarjetas rojas en la posición DF, siendo que la tendencia de sus países rivales es de 1 tarjeta roja por país para los defensores."),
                                  h4("--La hipótesis antes planteada en el grafico 2, se puede decir que es verdadera mediante los resultados del gráfico. ")
                              )
                      ),
                      ####CONCLUSIONES####
                      tabItem("Conclusiones",
                              box(width = 12, status = "info", background = "navy", title = "Conclusiones", 
                                  h4("A lo largo de este trabajo se expuso la idea de que la posición de defensa/DF en la base de datos empleada acerca de la Champions League es la posición más propensa a tener algún jugador con tarjeta roja, debido a todas las razones antes expuestas en relación a la cantidad de jugadores, faltas comprometidas, cantidad de partidos jugados en una posición determinada, país y sus edades. Adicionalmente, se creó y argumento acerca de una hipótesis que plantea que la edad es un factor que se relaciona con las tarjetas rojas, aunque se pudo confirmar hasta cierto punto, es necesario un mejor análisis para definir dicha conclusión."),
                                  h4("Finalmente, un atributo que pienso es importante a tener en cuenta a futuro, es determinar exactamente qué tipo de razones hubo para que los defensores tuvieran tal cantidad de tarjetas rojas, ya sea por tecnicismos o actitudes antideportivas, además de cómo se mencionó anteriormente, comparar con otros estudios más elaboras para así poder corregir el patrón de dicho jugador.  ")
                              )
                      ),
                      tabItem("Bibliografía",
                              box(width = 12, status = "info", background = "light-blue", title = "Bibliografía",
                                  h4("->https://www.researchgate.net/figure/Figura-2-Promedio-de-tarjetas-amarillas-Fuente-elaboracion-propia-con-datos-de_fig1_320151136"),
                                  h4("->https://es.uefa.com/uefachampionsleague/news/027d-17233a7fd323-beac5a4a678b-1000--tarjetas-amarillas-en-champions-league-cuantas-tarjetas-prov/"),
                                  h4("->https://www.marca.com/futbol/champions-league/2022/04/26/6266b083e2704e9d558b4603.html"),
                                  h4("->https://noti-deportes.com/que-significan-las-tarjetas-amarillas-y-rojas-en-el-futbol/#:~:text=En%20el%20f%C3%BAtbol%2C%20%E2%80%8B%E2%80%8Bdos%20tarjetas%20amarillas%20equivalen%20a,el%20jugador%20deber%C3%A1%20abandonar%20el%20terreno%20de%20juego.") )
                              
                      )
                    )
                  )
)
####SERVER####

server <- function(input, output) { 
  
  output$datos<-DT::renderDataTable(dataframe_tenis)
  output$grafico<-renderPlot({grafico.1})
  output$grafico2<-renderPlot({grafico.2})
  output$grafico3<-renderPlot({grafico.3})
  output$grafico4<-renderPlot({grafico.4})
  output$grafico5<-renderPlot({grafico.5})
  output$grafico6<-renderPlot({grafico.6})
  output$logoUCV<-renderImage({return(list(src = "www/logoUCV.png"), content_type = "image/png")})
  output$logoEECA<-renderImage({return(list(src = "www/logoEECA.jpg"), content_type = "image/png")})
}


shinyApp(ui,server)

