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
#####DASHBOARD####
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
                                menuItem("Introduccion", tabName = "Introduccion"),
                                menuItem("Planteamiento", id = "PlanteamientoID",
                                         menuSubItem("Desarrollo", tabName = "PlanteamientO",icon =icon("eye")),
                                         menuSubItem("Objetivos",  tabName = "Objetivos",icon =icon("eye")),
                                         menuSubItem("Preguntas de investigacion", tabName = "PreguntasDeInvestigacion", icon =icon("eye"))),
                                menuItem("Bases legales", tabName = "BasesLegales"),
                                menuItem("Documentacion", tabName = "Documentacion"),
                                menuItem("Base de datos", tabName = "Datos"),
                                menuItem("Estadisticas descriptivas", id = "EDID",
                                         menuSubItem("Puntos en el ranking", tabName = "estadistica1", icon = icon("eye")),
                                         menuSubItem("Altura", tabName = "estadistica2", icon = icon("eye")),
                                         menuSubItem("Edad", tabName = "estadistica3", icon = icon("eye")),
                                         menuSubItem("Dobles faltas", tabName = "estadistica4", icon = icon("eye")),
                                         menuSubItem("Aces", tabName = "estadistica5", icon = icon("eye")),
                                         menuSubItem("Puntos de servicio", tabName = "estadistica6", icon = icon("eye")),
                                         menuSubItem("Correlacion de PG y aces", tabName = "correlacion", icon = icon("eye"))
                                ),
                                menuItem("Graficos",id = "chartsID",
                                         menuSubItem("1er grafico", tabName = "grafico1", icon =icon("eye")),
                                         menuSubItem("2do grafico", tabName = "grafico2", icon =icon("eye")),
                                         menuSubItem("3er grafico", tabName = "grafico3", icon =icon("eye")),
                                         menuSubItem("4to grafico", tabName = "grafico4", icon =icon("eye")),
                                         menuSubItem("5to grafico", tabName = "grafico5", icon =icon("eye")),
                                         menuSubItem("6to grafico", tabName = "grafico6", icon =icon("eye")),
                                         menuSubItem("7mo grafico", tabName = "grafico7", icon =icon("eye")),
                                         menuSubItem("8vo grafico", tabName = "grafico8", icon =icon("eye")),
                                         menuSubItem("9no grafico", tabName = "grafico9", icon =icon("eye")),
                                         menuSubItem("10mo grafico",tabName = "grafico10",icon =icon("eye"))
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
                      ####PREGUNTAS DE INVESTIGACION####
                      tabItem("PreguntasDeInvestigacion",
                              box(title = "Preguntas", status = "info", widht = 12, HTML("<ul>
            <li>¿Existe una correlación positiva entre el número de aces marcados y los Partidos Ganados por jugador?</li>
            <li>¿Se puede predecir la cantidad de partidos ganados en función de los aces que marca un jugador?</li>
            <li>¿Cuáles son las estadísticas descriptivas de los jugadores del top 10 en términos de edad, altura, país de origen y estadísticas de juego?</li>
            <li>¿Existe una diferencia significativa en el rendimiento de los jugadores del top 10 según la superficie del torneo?</li>
            <li>¿Según la edad cómo se comportan las cualidades de los jugadores?</li>
            <li>¿Cuál es el porcentaje de partidos ganados por país y continente?</li>
            <li>¿Qué país tiene más partidos ganados?</li>
          </ul>"))
                      ),
                      ####OBJETIVOS####
                      tabItem("Objetivos",
                              box(title = "Objetivos", status = "info", width = 12, HTML("<ul>
            <li>Analizar la relación entre los Aces marcados y los Partidos Ganados.</li>
            <li>Describir las características de los jugadores en el top 10.</li>
            <li>Comparar el rendimiento de los jugadores en diferentes superficies.</li>
            <li>Estudio del radio de victorias y derrotas de los jugadores en top 10.</li>
            <li>Observar la relación entre distintas variables.</li>
                                                                                           </ul>"))
                      ),
                      ####BASE DE DATOS-BODY#### 
                      
                      tabItem(tabName = "Datos", 
                              DTOutput("datos", width = "100%", height = "500px")
                      ),
                      ####BASES LEGALES####
                      tabItem(tabName = "BasesLegales",
                              box(title = "Bases legales", width = 12, background = "navy",
                                  h3("Ley de la función pública de estadística"), h4("Artículo 11: Los datos de carácter personal, sólo se podrán recolectar y someter a tratamiento, cuando sean adecuados, pertinentes y no excesivos en relación con el ámbito y 
                                                                               la finalidad determinada, explícita y legítima para la que se hayan obtenido."),
                                  h4("Estos datos no podrán usarse para finalidad distinta de aquella para la cual han sido recogidos. No se considerará incompatible el tratamiento posterior de los mismos con fines históricos o científicos."),
                                  h4("Artículo 16: Todas las personas naturales y jurídicas, privadas y públicas que difundan información estadística están en la obligación de indicar la fuente del dato.")
                              )
                      ),
                      ####DOCUMENTACION####
                      tabItem(tabName = "Documentacion",
                              box(title = "Documentacion", width = 12, background = "navy",
                                  h4("Cada campo representa un atributo específico relacionado con los partidos de tenis, como el ID del torneo, el nombre del mismo, la superficie de juego, el nivel del torneo, y los detalles del ganador, incluyendo sus Id, entradas, nombres, mano hábil (izquierda o derecha), altura, país de origen del jugador y edad. Esta estructura es relevante para el análisis estadístico de la investigación en curso."),
                                  HTML ("<ul> 
                                  <li>winner_id: Es la identificación del jugador en la base de datos.</li>
                                  <li>w_ace: Representa los ases del ganador del partido.</li>
                                  <li>w_df: Representa las dobles faltas del ganador del partido.</li>
                                  <li>w_svpt: Representa los puntos de servicio del ganador del partido.</li>
                                  <li>winner_ht: Representa la altura en centímetros del ganador del partido.</li>
                                  <li>winner_hand: Representa la mano hábil del ganador del partido.</li>
                                  <li>winner_age: Representa la edad en años del ganador del partido.</li>
                                  <li>PG: Representa los partidos ganados acumulados por jugador en cada torneo.</li>
                                  <li>winner_name:  Representa el nombre y el apellido del ganador del partido.</li>
                                  <li>winner_ioc: Representa el país representado mediante el COI.</li>
                                  <li>w_bpSaved: Representa los puntos de quiebre salvados por el ganador del partido.</li>
                                  <li>w_bpFaced: Representa los puntos de quiebre enfrentados por el ganador del partido.</li>
                                  <li>tourney_id: Es el identificador del torneo.</li>
                                  <li>surface: Es la superficie en la que se juega el partido.</li>
                                  <li>tourney_level: Es el nivel del torneo.</li>
                                  <li>tourney_name: Es el nombre del torneo.</li>
                                  </ul>")
                              )
                      ),
                      ####ESTADISTICAS DESCRIPTIVAS####
                      tabItem( tabName = "estadistica1",
                               box(width = 12,
                                   DTOutput("est.PuntosRank", width = "100%", height = "500px"), title = "Estadisticas descriptivas de los puntos en el ranking")
                      ),
                      
                      tabItem( tabName = "estadistica2",
                               box(width = 12,
                                   DTOutput("est.Altura", width = "100%", height = "500px"), title = "Estadisticas descriptivas de la altura")
                      ),
                      
                      tabItem( tabName = "estadistica3",
                               box(width = 12,
                                   DTOutput("est.Edad", width = "100%", height = "500px"), title = "Estadisticas descriptivas de la edad")
                      ),
                      
                      tabItem( tabName = "estadistica4",
                               box(width = 12,
                                   DTOutput("est.DFaltas", width = "100%", height = "500px"), title = "Estadisticas descriptivas de las dobles faltas")
                      ),
                      
                      tabItem( tabName = "estadistica5",
                               box(width = 12,
                                   DTOutput("est.Aces", width = "100%", height = "500px"), title = "Estadisticas descriptivas de los aces")
                      ),
                      
                      tabItem( tabName = "estadistica6",
                               box(width = 12,
                                   DTOutput("est.PtServicio", width = "100%", height = "500px"), title = "Estadisticas descriptivas de los puntos de servicio")
                      ),
                      
                      tabItem( tabName = "correlacion",
                               box(width = 12, title = "Correlacion mas alta para los partidos ganados", background = "light-blue", 
                                   DTOutput("Cor.PG.Aces", width = "100%", height = "500px"))
                      ),
                      
                      ####GRAFICOS####
                      tabItem(tabName = "grafico1",
                              fluidRow(
                                column(width = 10, 
                                       infoBox("2da posicion con mayor cantidad de tarjetas rojas acumuladas", h3("DF,MF/19.05%"),width =7 , color = "red"),
                                       infoBox("Posicion con mayor cantidad de tarjetas rojas acumuladas", h3("DF/28.57%"), width = 6, color = "blue"),
                                       fluidRow(column(width =10),
                                                box(title = "Box plot", plotlyOutput("grafico1"), background = "purple", width = 12)))
                              )),
                      
                      tabItem(tabName = "grafico2", 
                              fluidRow(
                                column(width = 7,
                                       box(title = "Grafico de dispersión ", plotlyOutput("grafico2"), background = "purple", width = 12)
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
                                       box(title = "Grafico de caja y bigote", plotlyOutput("grafico3"), background = "purple", width = 12)
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
                                       box(title = "Graficos de barras", plotlyOutput("grafico4"), background = "purple", width = 12)
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
                                       box(title = "Grafico de barras", plotlyOutput("grafico6"), background = "purple", width = 12)
                                ),
                                column(width = 5,
                                       infoBox("País con mayor cantidad de tarjetas rojas en DF", h3("DE/Alemania"), width = 12, color = "blue"
                                       ),
                                       valueBox("1", "Cantidad de tarjetas rojas mas frecuentes por pais en DF", icon = icon("chart-simple"), color ="light-blue", width = 12)
                                )
                              )
                      ),
                      
                      tabItem( tabName = "grafico7",
                               box( title = "Grafico de correlacion", plotlyOutput("grafico7"), width = 12, background = "purple")
                      ),
                      tabItem( tabName = "grafico8",
                               box( title = "Grafico de correlacion", plotOutput("grafico8"), width = 12, background = "purple")
                      ),
                      tabItem( tabName = "grafico9",
                               box( title = "Boxs plots", plotOutput("grafico9"), width = 12, background = "purple")
                      ),
                      tabItem( tabName = "grafico10",
                               box( title = "Grafico de dispersion", plotlyOutput("grafico10"), width = 12, background = "purple")
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
                      ####BIBLIOGRAFIA####
                      tabItem("Bibliografía",
                              box(width = 12, status = "info", background = "light-blue", title = "Bibliografía",
                                  HTML("<ul>
                                        <li> Sackmann, J. (2021). tennis_atp: ATP Tennis Rankings, Results, and Stats. https://github.com/JeffSackmann/tennis_atp   </li>
                                        <li> Sanchéz, B. (2013). Historia y evolución del tenis. Researchgate. https://www.researchgate.net/publication/259821837_Historia_y_evolucion_del_tenis   </li>
                                        <li> Sánchez, B. C. (2022). Cuál es el deporte más popular del mundo. mundodeportivo.  https://www.mundodeportivo.com/uncomo/deporte/articulo/cual-es-el-deporte-mas-popular-del-mundo-52978.html   </li>
                                        </ul>" )
                              )
                              
                      )
                    )
                  )
)
####SERVER####

server <- function(input, output) { 
  output$datos <- renderDT({datatable(dataframe_tenis, options = list(scrollX = TRUE)) })
  output$est.PuntosRank <- renderDT({datatable(dataframe.ED1) })
  output$est.Altura <-     renderDT({datatable(dataframe.ED2) })
  output$est.Edad <-       renderDT({datatable(dataframe.ED3) })
  output$est.DFaltas <-    renderDT({datatable(dataframe.ED4) })
  output$est.Aces <-       renderDT({datatable(dataframe.ED5) })
  output$est.PtServicio <- renderDT({datatable(dataframe.ED6) })
  output$Cor.PG.Aces <-    renderDT({datatable(dataframe.ED7) })
  output$grafico1<-renderPlotly({grafico.D.1})
  output$grafico2<-renderPlotly({grafico.D.2})
  output$grafico3<-renderPlotly({grafico.D.3})
  output$grafico4<-renderPlotly({grafico.D.4})
  output$grafico5<-renderPlot({grafico.5})
  output$grafico6<-renderPlotly({grafico.D.6})
  output$grafico7<-renderPlotly({grafico.D.7})
  output$grafico8<-renderPlot({grafico.8})
  output$grafico9<-renderPlot({grafico.9})
  output$grafico10<-renderPlotly({grafico.D.10})
  output$logoUCV<-renderImage({return(list(src = "www/logoUCV.png"), content_type = "image/png")})
  output$logoEECA<-renderImage({return(list(src = "www/logoEECA.jpg"), content_type = "image/png")})
}


shinyApp(ui,server)
