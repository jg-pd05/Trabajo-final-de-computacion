####LIBRERIAS####
installed.packages("httr")
installed.packages("shiny")
installed.packages("shinydashboard")
installed.packages("esquisse")
installed.packages("tidyverse")



library(httr)
library(shiny)
library(shinydashboard)
library(esquisse)
library(tidyverse)

####PROCESANDO DATA########
#data("ChampionsLeagueBD")

#View(ChampionsLeagueBD)

#class(ChampionsLeagueBD)

####GRAFICOS####

grafico_X<- ChampionsLeagueBD %>%
 filter(!(Posicion %in% c("MF,DF", "FW,DF"))) %>%
 ggplot() +
 aes(x = Posicion, fill = Posicion, weight = Tarjetas_rojas) +
 geom_bar() +
 scale_fill_manual(values = c(DF = "#F8766D", `DF,FW` = "#D78E0C", `DF,MF` = "#A1A400", FW = "#31B425", 
 `FW,DF` = "#00BD71", `FW,MF` = "#00BDBD", GK = "#20AFEC", MF = "#7C92FE", `MF,DF` = "#56DB0B", `MF,FW` = "#0FD3EE"
 )) +
 labs(x = "Posicion ", y = "Tarjetas rojas acumuladas", title = "Posicion con mayor cantidad de tarjetas rojas acumuladas") +
 theme_linedraw() +
 theme(plot.title = element_text(size = 15L, face = "bold.italic"), axis.title.y = element_text(size = 13L), 
 axis.title.x = element_text(size = 13L))



grafico_Y<- ChampionsLeagueBD %>%
 filter(Pais %in% c("DE", "DK", "ENG", "FR", "IT")) %>%
 filter(Posicion %in% "DF") %>%
 ggplot() +
 aes(x = Edad, y = Posicion, fill = Pais) +
 geom_boxplot() +
 scale_fill_manual(values = c(AT = "#EDE7F6", BE = "#D1C4E9", CZ = "#B39DDB", DE = "#9575CD", DK = "#7E57C2", 
                              ENG = "#673AB7", ES = "#5E35B1", FR = "#512DA8", HR = "#4527A0", IL = "#311B92", IT = "#A4C5E2", 
                              NL = "#B388FF", PT = "#7C3DFF", SCT = "#651FFF", UA = "#6200EA")) +
 labs(x = "Edades", y = "Posicion", title = "Edades de los defensores por pais con tarjeta roja") +
 theme_minimal() +
 theme(plot.title = element_text(size = 15L, face = "bold.italic"), axis.title.y = element_text(size = 13L), 
 axis.title.x = element_text(size = 13L))
  


grafico_Z<- ChampionsLeagueBD %>%
  filter(Tarjetas_rojas >= 1L & Tarjetas_rojas <= 1L) %>%
  ggplot() +
  aes(x = Partidos_jugados, y = Tarjetas_rojas, colour = Posicion) +
  geom_jitter(size = 1.5) +
  scale_color_hue(direction = 1) +
  labs(x = "Partidos jugados ", y = "Tarjetas rojas", title = "Partidos jugados relacionados a sus tarjetas rojas") +
  theme_linedraw() +
  theme(plot.title = element_text(size = 15L, face = "bold.italic"), axis.title.x = element_text(size = 13L)) +
  xlim(0,10)




grafico_A<- ChampionsLeagueBD %>%
 filter(Tarjetas_rojas >= 1L & Tarjetas_rojas <= 1L) %>%
 ggplot() +
 aes(x = Edad, fill = Posicion) +
 geom_histogram(bins = 30L) +
 scale_fill_hue(direction = 1) +
 labs(x = "Edad", y = "Total de jugadores", title = "Edades de los defensores con una tarjeta roja", 
 fill = "Posicion") +
 theme_linedraw() +
 theme(plot.title = element_text(size = 15L, face = "bold.italic"), 
 axis.title.x = element_text(size = 13L)) +
 facet_wrap(vars(Tarjetas_rojas))

 


grafico_B<- ChampionsLeagueBD %>%
 filter(Tarjetas_rojas >= 1L & Tarjetas_rojas <= 1L) %>%
 ggplot() +
 aes(x = Faltas_comprometidas, y = Posicion, fill = Posicion) +
 geom_boxplot() +
 scale_fill_hue(direction = 1) +
 labs(x = "Faltas comprometidas", y = "Posiciones", title = "Posiciones en relacion a las faltas comprometidas cuando poseen 1 tarjeta roja", 
 fill = "Posiciones") +
 theme_minimal() +
 theme(plot.title = element_text(size = 15L, face = "bold.italic"), 
 axis.title.y = element_text(size = 13L), axis.title.x = element_text(size = 13L)) +
 facet_wrap(vars(Tarjetas_rojas))



grafico_C<-ChampionsLeagueBD %>%
  filter(Pais %in% c("DE", "DK", "ENG", "FR", "IT")) %>%
  filter(Posicion %in% "DF") %>%
  ggplot() +
  aes(x = Pais, weight = Tarjetas_rojas) +
  geom_bar(fill = "#8D1C9D") +
  labs(x = "Pais", 
       y = "Tarjetas rojas ", title = "Paises con mas tarjetas rojas en defensa") +
  theme_classic() +
  theme(plot.title = element_text(size = 15L, 
                                  face = "bold.italic"), axis.title.y = element_text(size = 13L), axis.title.x = element_text(size = 13L)) +
  facet_wrap(vars(Posicion))+
  ylim(0,3)


####CALCULOS ESTADISTICOS####

summary((ChampionsLeagueBD) [10])
count((ChampionsLeagueBD)[3])
table((ChampionsLeagueBD)[3])
Suma_Tarjetas_rojas<-sum((ChampionsLeagueBD)[10])
N_Tarjetas_rojas<-count((ChampionsLeagueBD)[10])
Promedio_Tarjetas_rojas<-(Suma_Tarjetas_rojas/N_Tarjetas_rojas)
Promedio_Tarjetas_rojas_redondeado<-round(0.69601,2)
Cantidad_de_jugadores_DF<-round(226/727*100,2)
Cantidad_de_jugadores_MF<-round(172/727*100,2)

#####DASHBOARD
#DASHBOARD
####DASBOARD PAGE####
ui<-dashboardPage(title="TRABAJO FINAL DE COMPUTACION", skin= "purple",
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
                                menuItem("Portada", tabName = "portada"),
                                menuItem("Base de datos", tabName = "datos"),
                                menuItem("Planteamiento", tabName = "PlanteamientO"),
                                menuItem("Estadisticas",id = "chartsID",
                                         menuSubItem("1er grafico", tabName = "grafico", icon = shiny::icon("eye")),
                                         menuSubItem("2do grafico", tabName = "grafico4", icon =icon("eye")),
                                         menuSubItem("3er grafico", tabName = "grafico5", icon =icon("eye")),
                                         menuSubItem("4to grafico", tabName = "grafico2", icon =icon("eye")),
                                         menuSubItem("5to grafico", tabName = "grafico6", icon =icon("eye")),
                                         menuSubItem("6to grafico", tabName = "grafico3", icon =icon("eye"))
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
                      
                      tabItem("portada", box(h4("Universidad Central de Venezuela", align="center"), h4("Facultad de ciencias economicas y sociales", align="center"), 
                                             h4("Escuela de Ciencias Estadisticas y actuariales", align="center"), h4("Materia: Computacion I", align="center"), width = 12),
                              box(h1("Trabajo final de computacion", align="center"), h2("2da version", align="center"), width = 12, background = "light-blue"),
                              box(h4("Integrantes del grupo 8-2:", align="right"), h4("Palma Jose----C.I 31.127.315", align="right"), h4("Boada Greysimar----C.I 31.291.620", align="right"),
                                  h4("Caracas, noviembre de 2023", align="center"),width = 12)
                              
                      ),
####PLANTEAMIENTO####                     
                      tabItem("PlanteamientO", 
                              fluidRow(
                                column( width = 8,
                                        box(title="Plantemiento", status = "info", width = 12,
                                            h4("En el amplio mundo del futbol, existen ciertos reglamentos que protegen tanto al jugador como al flujo natural del partido, sin embargo, en ocasiones esas reglas son incumplidas
                                               por los jugadores en el transcurso del partido, lo cual lleva a una consecuencia, afectando tanto al jugador como a su equipo, que son las tarjetas rojas recibidas por los mismos. 
                                               Dichas tarjetas son consideradas la sanción más tenaz del juego, ya que, no solo se expulsa de este, sino que, también recaen sanciones en partidos posteriores."),
                                            h4("En el presente trabajo se tiene como objetivo dar respuesta a la siguiente pregunta ¿Qué posición de los jugadores en la Champions League es más propensa a tener mayor número de 
                                               tarjetas rojas y a qué se asocia dicho comportamiento? Esta pregunta en específico puede ser de interés para algunos analistas de futbol los cuales les interesa saber en qué posición 
                                               sus jugadores tienen más riesgo de sufrir dicha sanción, ya que perjudica considerablemente las expectativas del fanático, el cual espera que su equipo triunfe."),
                                            background = "navy")),
                                column(width = 4, 
                                       box(title="Abreviaturas (países)", status = "info", width = 6, h4("-AT=Australia"),
                                           h4("-BE=Bélgica"),h4("-CZ=Republica Checa"),h4("-DE=Alemania"),h4("-DK=Dinamarca"),h4("-ENG=Inglaterra"),
                                           h4("-ES=España"),h4("-FR=Francia"),h4("-HR=Croacia"),h4("-IL=Israel"),h4("-IT=Italia"),h4("-NL=Países Bajos"),
                                           h4("-PT=Portugal"),h4("-SCT=Escocia"),h4("-UA=Ucrania"),background = "light-blue"),
                                       box(title="Abreviaturas (posiciones)", status = "info", width = 6, h4("-GK= Arquero"),h4("-DF= Defensa"),  
                                           h4("-DF,FW= Defensa delantera"), h4("-DF,MF= Defensa central"), h4("-MF= Centrocampista"), h4("-MF,DF= Mediocampista defensivo"),
                                           h4("-MF,FW= Mediocampista ofensivo"),h4("-FW= Delantero"),h4("-FW,DF= Delantero interno"),h4("-FW,MF= Delantero centro"), 
                                           background = "light-blue")
                                )
                                
                              )),
####BASE DE DATOS-BODY#### 

                      tabItem(tabName = "datos", 
                              DT::dataTableOutput("datos")
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
  
  output$datos<-DT::renderDataTable(ChampionsLeagueBD_version_recortada_)
  output$grafico<-renderPlot({grafico_X})
  output$grafico2<-renderPlot({grafico_Z})
  output$grafico3<-renderPlot({grafico_Y})
  output$grafico4<-renderPlot({grafico_A})
  output$grafico5<-renderPlot({grafico_B})
  output$grafico6<-renderPlot({grafico_C})
}

shinyApp(ui,server)
