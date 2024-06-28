####LIBRERIAS####
library(plotly)
library(httr)
library(shiny)
library(shinydashboard)
library(esquisse)
library(tidyverse)
library(DT)
library(readxl)
library(ggplot2)
library(dplyr)
library(grid)
library(e1071)

####Graficos y calculos estadisticos####
####Dataframes####
#dataframe_tenis <- read_excel("R/dataframe-tenis.xlsx")
#View(dataframe_tenis)
####Estadisticas####


dataframe.ED1 <- data.frame(
  Minimo = c("4"),
  Cuartil.1 = c("1006"),
  Mediana = c("1690"),
  Media = c("2448"),
  Cuartil.3 = c("2875"),
  Maximo = c("16950"),
  Des.Estandar = c("2381.3"),
  Asimetria = c("2.41"),
  Curtosis = c("6.85") )

#est.PuntosRank <- summary(dataframe_tenis$winner_rank_points)
#Var.PuntosRank <- var(dataframe_tenis$winner_rank_points, na.rm = TRUE)
#DesEstandar.PuntosRank <- sqrt(5670576)
#Sim.PuntosRank <- skewness(dataframe_tenis$winner_rank_points, na.rm = TRUE)
#Cur.PuntosRank <- kurtosis(dataframe_tenis$winner_rank_points, na.rm = TRUE )

dataframe.ED2 <- data.frame(
  Minimo = c("170"),
  Cuartil.1 = c("183"),
  Mediana = c("185"),
  Media = c("186"),
  Cuartil.3 = c("190"),
  Maximo = c("206"),
  Des.Estandar = c("7.05"),
  Asimetria = c("0.41"),
  Curtosis = c("0.15") )

#est.altura <- summary(dataframe_tenis$winner_ht)
#Var.altura <- var(dataframe_tenis$winner_ht, na.rm = TRUE)
#DesEstandar.altura <- sqrt(49.73896)
#Sim.altura <- skewness(dataframe_tenis$winner_ht, na.rm = TRUE)
#Cur.altura <- kurtosis(dataframe_tenis$winner_ht, na.rm = TRUE )

dataframe.ED3 <- data.frame(
  Minimo = c("15"),
  Cuartil.1 = c("23"),
  Mediana = c("26"),
  Media = c("25.86"),
  Cuartil.3 = c("29"),
  Maximo = c("39"),
  Des.Estandar = c("7.05"),
  Asimetria = c("0.3"),
  Curtosis = c("-0.39") )

#est.edad <- summary(dataframe_tenis$winner_age)
#Var.edad <- var(dataframe_tenis$winner_age, na.rm = TRUE)
#DesEstandar.edad <- sqrt(17.97481)
#Sim.edad <- skewness (dataframe_tenis$winner_age, na.rm = TRUE)
#Cur.edad <- kurtosis (dataframe_tenis$winner_age, na.rm = TRUE)

dataframe.ED4 <- data.frame(
  Minimo = c("0"),
  Cuartil.1 = c("1"),
  Mediana = c("2"),
  Media = c("2.77"),
  Cuartil.3 = c("4"),
  Maximo = c("17"),
  Des.Estandar = c("2.34"),
  Asimetria = c("1.37"),
  Curtosis = c("2.72") )

#est.faltas <- summary(dataframe_tenis$w_df)
#Var.faltas <- var(dataframe_tenis$w_df, na.rm = TRUE)
#DesEstandar.faltas <- sqrt(5.46527)
#Sim.faltas <- skewness (dataframe_tenis$w_df, na.rm = TRUE)
#Cur.faltas <- kurtosis (dataframe_tenis$w_df, na.rm = TRUE)

dataframe.ED5 <- data.frame(
  Minimo = c("0"),
  Cuartil.1 = c("3"),
  Mediana = c("6"),
  Media = c("7.31"),
  Cuartil.3 = c("10"),
  Maximo = c("113"),
  Des.Estandar = c("5.87"),
  Asimetria = c("2.48"),
  Curtosis = c("21.71") )

#est.aces <- summary(dataframe_tenis$w_ace)
#Var.aces <- var(dataframe_tenis$w_ace, na.rm = TRUE)
#DesEstandar.aces <- sqrt(34.5152)
#Sim.aces <- skewness (dataframe_tenis$w_ace, na.rm = TRUE)
#Cur.aces <- kurtosis (dataframe_tenis$w_ace, na.rm = TRUE)

dataframe.ED6 <- data.frame(
  Minimo = c("0"),
  Cuartil.1 = c("57"),
  Mediana = c("73"),
  Media = c("78.62"),
  Cuartil.3 = c("95"),
  Maximo = c("491"),
  Des.Estandar = c("29.69"),
  Asimetria = c("1.33"),
  Curtosis = c("7.23") )

#est.PtServicio <- summary(dataframe_tenis$w_svpt)
#Var.PtServicio <- var(dataframe_tenis$w_svpt, na.rm = TRUE)
#DesEstandar.PtServicio <- sqrt(881.4402)
#Sim.PtServicio <- skewness (dataframe_tenis$w_svpt, na.rm = TRUE)
#Cur.PuntosRank <- kurtosis (dataframe_tenis$w_svpt, na.rm = TRUE)

#Correlaciones

#lm(dataframe_tenis$PG ~ dataframe_tenis$winner_age) 
#summary(Correlacion1)
#sqrt(8.444e-05) #La correlacion es igual a 0.92%
#No hay casi carrelacion entre los partidos ganados y la edad de los tenistas

dataframe.ED7 <- data.frame(
  Cor.Pearson.PG_aces = "16.67%",
  R.cuadrado = "2.78%",
  Coe.A = "261.5749",
  Coe.B = "9.2613")

#lm(dataframe_tenis$PG ~ dataframe_tenis$w_ace) 
#summary(Correlacion2)
#sqrt (0.02778) #La correlacion es igual a 16.67%
#Hay una mayor correlacion entre los partidos ganados y los aces del ganador, sin embargo, no es suficientemente grande

#lm(dataframe_tenis$PG ~ dataframe_tenis$w_df) 
#summary(Correlacion3)
#sqrt (0.009878) #La correlacion es igual a 9.94%
#Hay una correlacion lineal directa baja entre las dobles faltas y los partidos ganados entre los tenistas 

#lm(dataframe_tenis$PG ~ dataframe_tenis$w_bpFaced) 
#summary(Correlacion4)
#sqrt (0.002664) #La correlacion es igual a 5.16%
#Hay una correlacion lineal directa baja entre los puntos de quiebre enfrentados y los partidos ganados entre los tenistas 

#lm(dataframe_tenis$PG ~ dataframe_tenis$w_bpSaved) 
#summary(Correlacion5)
#sqrt (0.002111) #La correlacion es igual a 4.59%
#Hay una correlacion lineal directa baja entre los puntos de quiebre salvados y los partidos ganados entre los tenistas 

#lm(dataframe_tenis$PG ~ dataframe_tenis$winner_ht) 
#summary(Correlacion6)
#sqrt (0.0007251) #La correlacion es igual a 2.69%
#Hay una correlacion lineal directa baja entre la altura y los partidos ganados entre los tenistas

#lm(dataframe_tenis$w_df ~ dataframe_tenis$winner_age)
#summary(Correlacion7)
#sqrt (0.0004233) #La correlacion es igual a 2.06%
#Hay una correlacion lineal directa baja entre las dobles faltas y la edad de los tenistas


####Creacion de los graficos####

#Graficos para los partidos ganados en relacion a la edad en diferente niveles de torneo y por la mano habil de los tenistas

grafico.1 <- dataframe_tenis %>%
  filter(winner_hand %in% "R") %>%
  filter(tourney_level %in% "G") %>%
  ggplot() +
  aes(y = PG, x = winner_age) +
  geom_point(size = 0.95, shape = "circle small", 
             colour = "#7F0D9A") +
  geom_boxplot(aes(group = PG), fill = "#5086E7") +
  labs(y = "Partidos ganados", 
       x = "Edades", title = "Edades y partidos ganados en torneos", subtitle = "Nivel \"G\" / Mano \"derecha\"") +
  theme_linedraw() +
  theme(plot.title = element_text(size = 16L, face = "bold.italic"), plot.subtitle = element_text(size = 9L, 
                                                                                                  face = "bold.italic"), axis.title.y = element_text(face = "italic"), axis.title.x = element_text(face = "italic")) +
  facet_wrap(vars(tourney_level))

grafico.D.1 <-  ggplotly(grafico.1)

grafico.2 <- dataframe_tenis %>%
  filter(winner_hand %in% "L") %>%
  filter(tourney_level %in% "G") %>%
  ggplot() +
  aes(y = PG, x = winner_age) +
  geom_point(size = 0.95, shape = "circle small", 
             colour = "#7F0D9A") +
  geom_boxplot(aes(group = PG), fill = "#5086E7") +
  labs(y = "Partidos ganados", 
       x = "Edades", title = "Edades y partidos ganados en torneos", subtitle = "Nivel \"G\" / Mano \"izquierda\"") +
  theme_linedraw() +
  theme(plot.title = element_text(size = 16L, face = "bold.italic"), plot.subtitle = element_text(size = 9L, 
                                                                                                  face = "bold.italic"), axis.title.y = element_text(face = "italic"), axis.title.x = element_text(face = "italic")) +
  facet_wrap(vars(tourney_level))

grafico.D.2 <-  ggplotly(grafico.2)

grafico.3 <- dataframe_tenis %>%
  filter(winner_hand %in% "R") %>%
  filter(tourney_level %in% "M") %>%
  ggplot() +
  aes(x = winner_age, y = PG, group = winner_age) +
  geom_point(size = 0.5, shape = "circle plus", 
             colour = "#7F0D9A") +
  geom_boxplot(fill = "#5086E7") +
  labs(x = "Edades", y = "Partidos ganados", 
       title = "Edades y partidos ganados en torneos", subtitle = "Nivel \"M\" / Mano \"derecha\"") +
  theme_linedraw() +
  theme(plot.title = element_text(size = 16L, 
                                  face = "bold.italic"), plot.subtitle = element_text(size = 9L, face = "italic"), axis.title.y = element_text(face = "italic"), 
        axis.title.x = element_text(face = "italic")) +
  facet_wrap(vars(tourney_level))

grafico.D.3 <-  ggplotly(grafico.3)

grafico.4 <- dataframe_tenis %>%
  filter(winner_hand %in% "L") %>%
  filter(tourney_level %in% "M") %>%
  ggplot() +
  aes(x = winner_age, y = PG, group = winner_age) +
  geom_point(size = 0.5, shape = "circle plus", 
             colour = "#7F0D9A") +
  geom_boxplot(fill = "#5086E7") +
  labs(x = "Edades", y = "Partidos ganados", 
       title = "Edades y partidos ganados en torneos", subtitle = "Nivel \"M\" / Mano \"izquierda\"") +
  theme_linedraw() +
  theme(plot.title = element_text(size = 16L, 
                                  face = "bold.italic"), plot.subtitle = element_text(size = 9L, face = "italic"), axis.title.y = element_text(face = "italic"), 
        axis.title.x = element_text(face = "italic")) +
  facet_wrap(vars(tourney_level))

grafico.D.4 <-  ggplotly(grafico.4)

#grafico de sectores para la participacion de los jugadores en torneos por cada pais 

grafico.5 <- ggplot(dataframe_tenis) +
  aes(x = winner_ioc, colour = winner_ioc) +
  geom_bar(fill = "#112446") +
  geom_text(stat = 'count', aes(label = scales::percent(..count../sum(..count..))),
            position = position_dodge(width = 0.8), vjust = 0, size = 3, hjust = -0.1) +
  labs(x = "Paises", y = "Participacion de los tenistas en torneos", title = "Participacion de tenistas en torneos en relacion a su pais") +
  theme_linedraw() +
  coord_flip() +
  theme(legend.position = "none", plot.title = element_text(size = 16L, face = "bold.italic"), 
        axis.title.y = element_text(face = "italic"), axis.title.x = element_text(face = "italic"))

ggplotly(grafico.5)


#relacion entre las faltas de los jugadores y su edad

grafico.6 <- ggplot(dataframe_tenis) +
  aes(x = winner_age, y = w_df) +
  geom_jitter(size = 1L, shape = "circle small", 
              colour = "#5C31DB") +
  labs(x = "Edades", y = "Faltas", title = "Faltas en relacion a las edades") +
  theme_linedraw() +
  theme(axis.title.y = element_text(face = "italic"), axis.title.x = element_text(face = "italic"))

grafico.D.6 <- ggplotly(grafico.6)

#Grafico de dispersion para el modelo de regresion lineal bivariante para los partidos ganados (dependiente) y los aces (independiente)

grafico.7 <- ggplot(dataframe_tenis) +
  aes(x = w_ace, y = PG) +
  geom_jitter(size = 0.6, colour = "#3300EA") +
  geom_smooth(method = "lm", se = TRUE, colour = "#B146E2") +
  labs(x = "Aces", y = "Partidos ganados", 
       title = "Diagrama de dispersion para los partidos ganados en relacion a los aces") +
  theme_linedraw() +
  theme(plot.title = element_text(size = 16L, face = "bold.italic"), axis.title.y = element_text(face = "italic"), 
        axis.title.x = element_text(face = "italic"))

grafico.D.7 <- ggplotly(grafico.7)

#Grafico de victorias por paises en torneos de nivel "M" y "G"


grafico.8 <- ggplot(dataframe_tenis) +
  aes(x = winner_ioc, y = PG, fill = winner_ioc) +
  geom_col() +
  scale_fill_viridis_d(option = "magma", 
                       direction = 1) +
  labs(x = "Paises", y = "Partidos ganados", title = "Partidos ganados por pais") +
  theme_linedraw() +
  theme(legend.position = "none") +
  theme(plot.title = element_text(size = 16L, face = "bold.italic"), axis.title.y = element_text(face = "italic"), 
        axis.title.x = element_text(face = "italic"), axis.text.y = element_text(face = "italic", angle = 30L), 
        axis.text.x = element_text(face = "italic", angle = 30L))

#Grafico de radio de victorias de cada jugador 

grafico.9 <- dataframe_tenis %>%
  filter(winner_ioc %in% "ESP") %>%
  ggplot() +
  aes(x = PG, y = winner_name, fill = winner_name) +
  geom_boxplot() +
  scale_fill_viridis_d(option = "magma", 
                       direction = 1) +
  labs(x = "Partidos ganados", y = "Tenista de españa", title = "Partidos ganados de los tenistas en españa", 
       fill = "Tenistas de españa") +
  coord_flip() +
  theme_minimal() +
  theme(plot.title = element_text(size = 16L, 
                                  face = "bold.italic"), axis.title.x = element_text(face = "italic"), axis.text.y = element_text(face = "italic"), 
        axis.text.x = element_text(face = "italic", angle = 35L, size = 8L), legend.text = element_text(face = "italic"), legend.title = element_text(face = "italic"))


#Grafico del rendimiento de los jugadores dependiendo de la superficie


grafico.10 <- dataframe_tenis %>%
  filter(winner_ioc %in% "ESP") %>%
  ggplot() +
  aes(x = PG, y = winner_rank_points, fill = tourney_name, colour = winner_name) +
  geom_point(size = 0.5, shape = "asterisk") +
  scale_fill_viridis_d(option = "viridis", direction = 1) +
  scale_color_viridis_d(option = "viridis", direction = 1) +
  labs(x = "Partidos ganados", y = "Puntos en el ranking para el torneo x", title = "Partidos ganados en relacion a los puntos de ranking para los jugadores en España ") +
  theme_minimal() +
  theme(legend.position = "none", plot.title = element_text(size = 16L, face = "bold.italic"), axis.title.y = element_text(face = "italic"), axis.title.x = element_text(face = "italic"), 
        axis.text.y = element_text(face = "italic"), axis.text.x = element_text(face = "italic"))


grafico.D.10 <- ggplotly(grafico.10)

#Rendimiento de los tenistas por superficie

grafico.11 <- ggplot(dataframe_tenis) +
  aes(x = PG, colour = tourney_name) +
  geom_histogram(bins = 30L, fill = "#112446") +
  scale_color_viridis_d(option = "plasma", direction = 1) +
  labs(x = "Partidos ganados", y = "Conteo", 
       title = "Rendimiento de los tenistas por superficie") +
  theme_minimal() +
  theme(legend.position = "none", 
        plot.title = element_text(size = 16L, face = "bold.italic"), axis.title.y = element_text(face = "italic"), 
        axis.title.x = element_text(face = "italic")) +
  facet_wrap(vars(surface), scales = "free")

grafico.D.11 <- ggplotly(grafico.11)


#####DASHBOARD####
####DASBOARD PAGE####
ui<-dashboardPage(title="TRABAJO FINAL DE COMPUTACION 2", skin= "purple",
                  dashboardHeader(title="Contenido",
                                  dropdownMenu(type="notifications",
                                               notificationItem(text="Trabajo hecho con fines academicos")
                                               
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
                                         menuSubItem("10mo grafico",tabName = "grafico10",icon =icon("eye")),
                                         menuSubItem("11avo grafico", tabName = "grafico11", icon = icon("eye"))
                                ),
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
                              box(h1("Análisis de cualidades de jugadores de tenis del top 10, un enfoque estadístico", align="center"), width = 12, background = "light-blue", style = "border: 3px solid blue"),
                              box(h4("Integrantes del grupo 2:", align="right"), h4("Jose Palma----C.I 31.127.315", align="right"), h4("Miguel Sanz----C.I 31.532.742", align="right"), h4("Jesús Arellano----C.I 27.566.992", align="right"),
                                  h4("Caracas, junio de 2024", align="center"),width = 12, style = "border: 3px solid blue")
                              
                      ),
                      ####INTRODUCCION####
                      tabItem("Introduccion",
                              box(title = "Introduccion", width = 12, status = "info", background = "navy",
                                  h4("Según Sanchéz, B. (2013). “Los primeros juegos de pelota semejantes al tenis aparecen en la Antigua Grecia y el Imperio Romano, y alcanza su máximo auge en la Edad Media, a través del denominado “Jeu de la paume”, en Francia e Inglaterra, antes de producirse su declive en el siglo XVIII. Finalmente, la aparición del tenis moderno o “lawn tennis” a finales del siglo XIX y su expansión por Europa, 
                                 América y Australia, produjo la creación de clubes, torneos y asociaciones destinadas a la difusión y práctica de este deporte”. Parafraseando a Sánchez (2022) hasta la actualidad el tenis ha evolucionado a lo que conocemos hoy día y se ha convertido en el cuarto deporte más famoso del mundo, en consecuencia, la popularidad del mismo surge en la audiencia de este deporte la necesidad de obtener información 
                                 sobre torneos, jugadores, y estadística en general. De las razones planteadas anteriormente surge la inquietud de analizar las cualidades de los jugadores de forma general con fin de describir los resultados de interés de dicha investigación."),
                                  h4("Para efectuar la investigación se utilizaron distintas herramientas tecnológicas las cuales apoyan de forma eficiente la obtención de los resultados, entre ellas SQLite; para la gestión de los datos, Power Bi para una visualización atrayente de los datos, y el lenguaje de programación estadístico R.")
                              )
                      ),
                      ####PLANTEAMIENTO####                     
                      tabItem("PlanteamientO", 
                              box(title="Plantemiento", status = "info", width = 12, background = "navy",
                                  h4("El tenis es un deporte complejo que exige una combinación de habilidades físicas, técnicas y mentales. En este contexto, diversas variables pueden influir en el rendimiento de un jugador, incluyendo su edad, superficie de juego, estilo de juego, experiencia y condiciones físicas además de ello también es de interés ver cómo se comportan variables con respecto a la edad o la altura,
                                               como lo son los partidos ganados de los jugadores la cantidad de Aces realizados, dobles faltas entres otras características de interés de las cuales se pueden llegar a conclusiones que podrán estimar el comportamiento del mismo deporte que se tomó en cuenta para esta investigación, la misma tiene como objetivo analizar el comportamiento de las variables anteriormente mencionadas relevantes 
                                               en el tenis masculino de alto nivel, utilizando datos de jugadores del top 10 del ranking ATP entre los años 2000 y 2024 y tomando en cuenta además solo los torneos del Grand Slam y El Máster para el análisis de los resultados de la investigación que se realiza a consecuencia de los datos de una muestra realizada de Sackmann,(2021).")
                              )),
                      ####PREGUNTAS DE INVESTIGACION####
                      tabItem("PreguntasDeInvestigacion",
                              box(title = "Preguntas", status = "info", widht = 12, background = "navy", HTML("<ul>
            <li>¿Existe una correlación positiva entre el número de aces marcados y los Partidos Ganados por jugador?</li>
            <li>¿Se puede predecir la cantidad de partidos ganados en función de los aces que marca un jugador?</li>
            <li>¿Cuáles son las estadísticas descriptivas de los jugadores del top 10 en términos de edad, altura, país de origen y estadísticas de juego?</li>
            <li>¿Existe una diferencia significativa en el rendimiento de los jugadores del top 10 según la superficie del torneo?</li>
            <li>¿Según la edad cómo se comportan las cualidades de los jugadores?</li>
            <li>¿Cuál es el porcentaje de los primeros cinco países con más partidos ganados.?</li>
            <li>¿Cuál es el país que tiene mayor participación en torneos de nivel Master y Grand Slam?</li>
            <li>Del país con más partidos ganados, ¿Qué jugador gano más partidos?</li>
            <li>En el país con más victorias, ¿Cuál es jugador con más puntos acumulados en el ranking?</li>
          </ul>"))
                      ),
                      ####OBJETIVOS####
                      tabItem("Objetivos",
                              box(title = "Objetivos", status = "info", width = 12, background = "navy",HTML("<ul>
            <li>Analizar la relación entre los Aces marcados y los Partidos Ganados.</li>
            <li>Describir las características de los jugadores en el top 10.</li>
            <li>Comparar el rendimiento de los jugadores en diferentes superficies.</li>
            <li>Estudio del radio de victorias y derrotas de los jugadores en top 10.</li>
            <li>Observar la relación entre distintas variables.</li>
          </ul>"))
                      ),
                      ####BASE DE DATOS-BODY#### 
                      
                      tabItem(tabName = "Datos", 
                              box(width = 12, style = "border: 3px solid purple",
                                  DTOutput("datos", width = "100%", height = "500px") )
                      ),
                      ####BASES LEGALES####
                      tabItem(tabName = "BasesLegales",
                              box(title = "Bases legales", width = 12, status = "info", background = "navy",
                                  h3("Ley de la función pública de estadística"), h4("Artículo 11: Los datos de carácter personal, sólo se podrán recolectar y someter a tratamiento, cuando sean adecuados, pertinentes y no excesivos en relación con el ámbito y 
                                                                               la finalidad determinada, explícita y legítima para la que se hayan obtenido."),
                                  h4("Estos datos no podrán usarse para finalidad distinta de aquella para la cual han sido recogidos. No se considerará incompatible el tratamiento posterior de los mismos con fines históricos o científicos."),
                                  h4("Artículo 16: Todas las personas naturales y jurídicas, privadas y públicas que difundan información estadística están en la obligación de indicar la fuente del dato.")
                              )
                      ),
                      ####DOCUMENTACION####
                      tabItem(tabName = "Documentacion",
                              box(title = "Documentacion", width = 12, status = "info", background = "navy",
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
                               box(width = 12, style = "border: 3px solid purple",
                                   DTOutput("est.PuntosRank", width = "100%", height = "150px"), title = "Estadisticas descriptivas de los puntos en el ranking"),
                               fluidRow(
                                 column( width = 6,
                                         infoBox("Valor minimo y maximo", color = "blue", width = 12, h5 ("4 y 16950 puntos en el ranking")),
                                         infoBox("Media y des. estandar",color = "blue", width = 12, h5("2448 y 2381.3 puntos en el ranking"))
                                 ),
                                 column( width = 6,
                                         box( width = 12, title = "Cuartiles",
                                              infoBox("1ero", color = "blue", width = 4, h5("1006")),
                                              infoBox("2do", color = "blue", width = 4, h5("1690")),
                                              infoBox("3ero", color = "blue", width = 4, h5("2875"))
                                         ),
                                         infoBox("Asimetria", color = "purple", width = 6, h5("Asimetria positiva")),
                                         infoBox("Curtosis", color = "purple", width = 6, h5("Leptocurtica"))
                                 )
                               )  
                      ),
                      
                      tabItem( tabName = "estadistica2",
                               box(width = 12, style = "border: 3px solid purple",
                                   DTOutput("est.Altura", width = "100%", height = "150px"), title = "Estadisticas descriptivas de la altura"),
                               fluidRow(
                                 column( width = 6,
                                         infoBox("Valor minimo y maximo", color = "blue", width = 12, h5 ("170cm y 206cm")),
                                         infoBox("Media y des. estandar",color = "blue", width = 12, h5("186cm y 7.05cm"))
                                 ),
                                 column( width = 6,
                                         box( width = 12, title = "Cuartiles",
                                              infoBox("1ero", color = "blue", width = 4, h5("183cm")),
                                              infoBox("2do", color = "blue", width = 4, h5("185cm")),
                                              infoBox("3ero", color = "blue", width = 4, h5("190cm"))
                                         ),
                                         infoBox("Asimetria", color = "purple", width = 6, h5("Asimetria positiva")),
                                         infoBox("Curtosis", color = "purple", width = 6, h5("Platicurtica"))
                                 )
                               )  
                      ),
                      
                      tabItem( tabName = "estadistica3",
                               box(width = 12, style = "border: 3px solid purple",
                                   DTOutput("est.Edad", width = "100%", height = "150px"), title = "Estadisticas descriptivas de la edad"),
                               fluidRow(
                                 column( width = 6,
                                         infoBox("Valor minimo y maximo", color = "blue", width = 12, h5 ("15 y 39 años de edad")),
                                         infoBox("Media y des. estandar",color = "blue", width = 12, h5(" 25.86 y  7.05 años de edad"))
                                 ),
                                 column( width = 6,
                                         box( width = 12, title = "Cuartiles",
                                              infoBox("1ero", color = "blue", width = 4, h5("23")),
                                              infoBox("2do", color = "blue", width = 4, h5("26")),
                                              infoBox("3ero", color = "blue", width = 4, h5("29"))
                                         ),
                                         infoBox("Asimetria", color = "purple", width = 6, h5("Asimetria positiva")),
                                         infoBox("Curtosis", color = "purple", width = 6, h5("Platicurtica"))
                                 )
                               )  
                      ),
                      
                      tabItem( tabName = "estadistica4",
                               box(width = 12, style = "border: 3px solid purple",
                                   DTOutput("est.DFaltas", width = "100%", height = "150px"), title = "Estadisticas descriptivas de las dobles faltas"),
                               fluidRow(
                                 column( width = 6,
                                         infoBox("Valor minimo y maximo", color = "blue", width = 12, h5 ("0 y 17 numero de faltas dobles")),
                                         infoBox("Media y des. estandar",color = "blue", width = 12, h5("2.77 y 2.34 numero de faltas dobles"))
                                 ),
                                 column( width = 6,
                                         box( width = 12, title = "Cuartiles",
                                              infoBox("1ero", color = "blue", width = 4, h5("1")),
                                              infoBox("2do", color = "blue", width = 4, h5("2")),
                                              infoBox("3ero", color = "blue", width = 4, h5("4"))
                                         ),
                                         infoBox("Asimetria", color = "purple", width = 6, h5("Asimetria positiva")),
                                         infoBox("Curtosis", color = "purple", width = 6, h5("Platicurtica"))
                                 )
                               )  
                      ),
                      
                      tabItem( tabName = "estadistica5",
                               box(width = 12, style = "border: 3px solid purple",
                                   DTOutput("est.Aces", width = "100%", height = "150px"), title = "Estadisticas descriptivas de los aces"),
                               fluidRow(
                                 column( width = 6,
                                         infoBox("Valor minimo y maximo", color = "blue", width = 12, h5 ("0 y 113 numero de aces")),
                                         infoBox("Media y des. estandar",color = "blue", width = 12, h5("7.31 y 5.87 numero de aces"))
                                 ),
                                 column( width = 6,
                                         box( width = 12, title = "Cuartiles",
                                              infoBox("1ero", color = "blue", width = 4, h5("3")),
                                              infoBox("2do", color = "blue", width = 4, h5("6")),
                                              infoBox("3ero", color = "blue", width = 4, h5("10"))
                                         ),
                                         infoBox("Asimetria", color = "purple", width = 6, h5("Asimetria positiva")),
                                         infoBox("Curtosis", color = "purple", width = 6, h5("Leptocurtica"))
                                 )
                               )  
                      ),
                      
                      tabItem( tabName = "estadistica6",
                               box(width = 12, style = "border: 3px solid purple",
                                   DTOutput("est.PtServicio", width = "100%", height = "150px"), title = "Estadisticas descriptivas de los puntos de servicio"),
                               fluidRow(
                                 column( width = 6,
                                         infoBox("Valor minimo y maximo", color = "blue", width = 12, h5 ("0 y 491 puntos de servicio")),
                                         infoBox("Media y des. estandar",color = "blue", width = 12, h5("78.62 y 29.69 puntos de servicio"))
                                 ),
                                 column( width = 6,
                                         box( width = 12, title = "Cuartiles", 
                                              infoBox("1ero", color = "blue", width = 4, h5("57")),
                                              infoBox("2do", color = "blue", width = 4, h5("73")),
                                              infoBox("3ero", color = "blue", width = 4, h5("95"))
                                         ),
                                         infoBox("Asimetria", color = "purple", width = 6, h5("Asimetria positiva")),
                                         infoBox("Curtosis", color = "purple", width = 6, h5("Leptocurtica"))
                                 )
                               )  
                      ),
                      
                      tabItem( tabName = "correlacion",
                               box(width = 12, style = "border: 3px solid purple",
                                   title = "Correlacion mas alta para los partidos ganados", 
                                   DTOutput("Cor.PG.Aces", width = "100%", height = "150px")),
                               fluidRow(
                                 column( width = 6,
                                         box( title = "Correlacion PG y aces", width = 12, background = "light-blue", status = "danger",
                                              h4("Lineal directa baja")),
                                         box( title = "¿Qué tan representativa son los aces para los PG?", width = 12, background = "light-blue", status = "danger",
                                              h4("Los aces explican en un 2.78% a los PG"))
                                 ),
                                 column( width = 6,
                                         infoBox("Coeficientes del modelo", width = 12, h4("a = 261.5749" ), h4 ("b = 9.2613") ))
                                 
                               ),
                               box(title = "Nota:", width = 12, collapsible = TRUE, collapsed = TRUE, status = "warning", background = "light-blue",
                                   h4("Entre todas las correlaciones realizadas, tomando en cuenta los partidos ganados como la dependiente, fue con la variable aces la mas alta entre todas las demas") )),
                      
                      ####GRAFICOS####
                      tabItem(tabName = "grafico1",
                              fluidRow(
                                column(width = 10, 
                                       infoBox("Edades con mas partidos ganados", h3("25 y 30 años"),width =7 , color = "red"),
                                       box(title = "Nota:", width = 12, background = "light-blue", collapsed = TRUE, collapsible = TRUE, status = "warning", 
                                           h4("Los graficos del uno al dos son las edades y partidos ganados en torneos para el nivel G con la mano derecha e izquierda y los graficos del tres al cuatro vendrian siendo lo mismo pero para el nivel de torneo M")),
                                       fluidRow(column(width =10),
                                                box(title = "Box plot", plotlyOutput("grafico1"), background = "purple", width = 12)))
                              )),
                      
                      tabItem(tabName = "grafico2", 
                              fluidRow(
                                column(width = 7,
                                       box(title = "Box plot", plotlyOutput("grafico2"), background = "purple", width = 12)
                                ),
                                column(width = 5,
                                       infoBox("Edades con mas partidos ganados", h3("18 y 25 años"), width = 12, color = "red")
                                )
                              )
                              
                      ),
                      tabItem(tabName = "grafico3", 
                              fluidRow(
                                column(width = 8,
                                       box(title = "Grafico de caja y bigote", plotlyOutput("grafico3"), background = "purple", width = 12)
                                ),
                                column(width = 4,
                                       infoBox("Edades con mas partidos ganados", h3("18 y 32 años"), width = 12, color = "red"))
                              )
                              
                      ),
                      tabItem(tabName = "grafico4",
                              fluidRow(
                                column(width = 8,
                                       box(title = "Graficos de barras", plotlyOutput("grafico4"), background = "purple", width = 12)
                                ),
                                column(width = 4,
                                       infoBox(title = "Edades con mas partidos ganados", h3("20 y 25 años"), width = 12, color = "red" ),
                                       valueBox("Observacion", "En tres de los cuatro graficos se ve una aparente tendencia de que los jugadores con mas partidos ganados en 
                                           torneos de nivel M y G es de 25 años", color= "light-blue", icon = icon("lightbulb"), width = 12)
                                )  
                              )
                      ),
                      
                      tabItem(tabName = "grafico5",
                              fluidRow(
                                column(width = 7,
                                       box(title = "Grafico de barras", plotOutput("grafico5"), background = "purple", width = 12)
                                ),
                                column(width = 5,
                                       infoBox("Pais con mayor participacion", h3("España"), width = 12, color = "blue"),
                                       valueBox("16.46%", "Porcentaje de participacion en torneos en comparacion con los otros paises", icon = icon("chart-simple"), color = "light-blue", width = 12)
                                )
                              )
                      ),
                      
                      tabItem(tabName = "grafico6",
                              fluidRow(
                                column(width = 7,
                                       box(title = "Grafico de barras", plotlyOutput("grafico6"), background = "purple", width = 12)
                                ),
                                column(width = 5,
                                       infoBox("Intervalo de edad con mas dobles faltas", h3("20-35"), width = 12, color = "blue"
                                       )
                                )
                              )
                      ),
                      
                      tabItem( tabName = "grafico11",
                               box( title = "Grafico de dispersion", plotlyOutput("grafico7"), width = 12, background = "purple"),
                               box( title = "Modelo de regresion lineal bivariante", tags$image(type = "image/png", src = "Coeficientes del modelo.png", height = "300px", width = "500px"), width = 8 , style = "border: 3px solid blue", status = "primary", background = "navy"),
                               fluidRow(
                                 column(width = 6,
                                        box(title = "Interpretacion acerca de los coeficientes", HTML( "<ul>
                                                                                               <li> El valor de “a” se puede interpretar para este modelo de manera tal que para cuando los aces sean igual a cero entonces a será el valor promedio de los partidos ganados. </li>
                                                                                               <li> “b” se interpreta de manera tal que será una razón de cambio que mide la variación  promedio de los partidos ganados por cambio unitario en los aces realizados, es decir que cada vez que aumenten los aces  realizados  entonces se espera que aumenten los partidos ganados.</li>
                                                                                               </ul>"), width = 6, background = "navy", status = "info"),
                                        box(title = "Inferencias acerca de los coeficientes de regresión A y B", HTML("<ul>
                                                                                                              <li> A: Coeficiente de regresión (variable dependiente) </li>
                                                                                                              <li> B: Coeficiente de regresión (variable independiente) </li>
                                                                                                              <li> Ho: A=B=0      H1: A ≠ B ≠ 0</li>
                                                                                                              <li> Nivel de significación: α=0.05</li>
                                                                                                              <li> Estadístico de contraste: P-valor = 2*e^(-16)</li>
                                                                                                              <li> Se rechaza Ho sii: P-valor < α </li>
                                                                                                              <li> Ya que el estadístico de contraste pertenece a la región crítica entonces se rechaza Ho con un nivel de significación del 5% por lo que se concluye que ambos coeficientes son distintos de 0.</li>
                                                                                                              </ul>"), width = 6, background = "navy", status = "info")
                                 ),
                                 column(width = 6,
                                        box( title = "Estimación de los coeficientes de regresión de μ_yx", HTML("<ul> 
                                                                                                          <li> A: Coeficiente de regresión constante</li>
                                                                                                          <li> Ho: A=0    H1: A≠0 </li>
                                                                                                          <li> Nivel de significación: α=0.05</li>
                                                                                                          <li> Estadístico de contraste: P-valor = 2*e^(-16)</li>
                                                                                                          <li> Se rechaza Ho sii: P-valor < α</li>
                                                                                                          <li> Se rechaza Ho, por lo que el coeficiente de regresión constante es distinto de cero, con un nivel de significación de 5% por tanto estadísticamente el coeficiente a es representativo para el parámetro.</li>
                                                                                                          <li> B: Pendiente de la recta de regresión</li>
                                                                                                          <li> Ho: B=0     H1: B≠0</li>
                                                                                                          <li> Nivel de significación: α=0.05</li>
                                                                                                          <li> Estadístico de contraste: P-valor = 2*e^(-16)</li>
                                                                                                          <li> Se rechaza Ho sii: P-valor < α</li>
                                                                                                          <li> Se rechaza Ho, por lo que el coeficiente de la pendiente de la recta de regresión es distinto de cero, con un nivel de significación de 5% por tanto estadísticamente el coeficiente b es representativo para el parámetro.</li>
                                                                                                          </ul>"), width = 12, background = "navy", status = "info"))
                               ),
                               box(title = "Resumen del modelo de regresion",  tags$image(type = "image/png", src = "Correlacion y R cuadrado.png", height = "300px", width = "650px"), width = 9 , style = "border: 3px solid blue", status = "primary", background = "navy",
                                   h4("Luego de desarrollar los cálculos necesarios se observa que el valor de R que es el coeficiente de correlación lineal de Pearson es de 0,167 por que se espera  que exista una relación lineal muy baja entre estas variables, del mismo valor se llega al r cuadrado el cual es el coeficiente de determinación que para esta investigación es 
                                      de  0,03 de lo que se puede decir que la variable partidos ganados es explicada por la variables aces solo un 3%, por lo que entonces el 97% restante es explicad por otras variables que no se tienen en cuenta para el modelo.")),
                               
                      ),
                      tabItem( tabName = "grafico7",
                               box( title = "Grafico de barras", plotOutput("grafico8"), width = 12, background = "purple"),
                               fluidRow(
                                 column(width = 6,
                                        infoBox("Pais con mas partidos ganados", h3("España"), width = 12, color = "blue"),
                                        infoBox("Segundo pais con mas partidos ganados", h3("Estados Unidos"), width = 12, color = "teal")
                                 ),
                                 column(width = 6,
                                        valueBox("16.9%", "Porcentaje de victorias de España en los torneos evaluados", icon = icon("chart-simple"), color = "light-blue", width = 6 ),
                                        valueBox("8.8%", "Porcentaje de victorias de Estados Unidos en los torneos evaluados", icon = icon("chart-simple"), color = "teal", width = 6 ))
                               )
                      ),
                      tabItem( tabName = "grafico8",
                               box( title = "Boxs plots", plotOutput("grafico9"), width = 12, background = "purple"),
                               infoBox("Jugador con mas partidos ganados", h3 ("Rafel Nadal"), width = 5, color = "blue")
                      ),
                      tabItem( tabName = "grafico9",
                               box( title = "Grafico de dispersion", plotlyOutput("grafico10"), width = 12, background = "purple"),
                               fluidRow(
                                 column(width = 6,
                                        infoBox("Jugador con mas puntos de ranking", h3("Rafael Nadal"), width = 12, color = "blue")),
                                 column(width = 6,
                                        valueBox("1673", "Mayor numero de partidos ganados en un torneo por Rafael Nadal", icon = icon("chart-simple"), color = "teal", width = 12 ))
                               )
                      ),
                      tabItem( tabName = "grafico10",
                               box(title = "Grafico de barras", plotlyOutput("grafico11"), width = 12, background = "purple"),
                               infoBox("Superficie con mayor rendimiento entre los tenistas del top 10", h3 ("Hard/Cemento"), width = 7, color = "blue")
                      ),
                      
                      ####CONCLUSIONES####
                      tabItem("Conclusiones",
                              box(width = 12, status = "info", background = "navy", title = "Conclusiones", HTML("<ul>
                        <li> Existe una correlación muy baja entre las variables, por tanto, la variable independiente explica muy poco a la dependiente.</li>
                        <li> Se denota que no se puede pronosticar con el modelo planteado ya que no se toman en cuenta otras variables las cuales explican de forma más concisa a la variable independiente, lo que quiere decir que los aces marcados por un jugador no explican de forma clara el comportamiento de los partidos ganados por si solos, por tanto, se sugiere ahondar en la investigación y aplicar técnicas estadísticas más avanzadas para llegar a resultados más precisos sobre el modelo planteado.</li>
                        <li> A partir de los resultados obtenidos se denota que existe una diferencia significativa en el rendimiento de los jugadores según en la superficie en la que juegan, viéndose que existe un mayor rendimiento cuando el juego se desarrolla en una superficie de cemento, seguidamente de la de arcilla.</li>
                        <li> Se llega a la conclusión de que los jugadores que tienen 18 y 25 años son los que presentan mayor desempeño con respecto a los partidos ganados, además de ello también es de interés acotar que cuando se toma en cuenta el nivel del torneo y la mano hábil del jugador entonces también son de interés aquellos jugadores que tienen 20 y 32 años .</li>
                        <li> Se observa que el país que más destaca con respecto a partidos ganados es España, representando con respecto al total del 16.9%, en segundo lugar, Estados Unidos con un 8.8%, en tercer lugar, Francia con un 8.69%, en cuarto lugar, Suiza con un 7.17% y el quinto lugar, Rusia con un 6.52%.</li>
                        <li> Según el análisis echo anteriormente, se puede observar que España es el país con más participaciones en torneos de nivel Grand Slam y Master, con un 16.46% de participaciones con respecto al total.</li>
                        <li> Se observa que en España el jugador con mayor cantidad de partidos ganados es Rafael Nadal, siendo que representa el 16.73% de los partidos ganados en dicho país. </li>
                        <li> Como se pudo apreciar en el noveno grafico, Rafael Nadal se mantiene en múltiples ocasiones con una alta cantidad puntos de ranking, es decir, que si se sumaran los puntos de ranking que ha obtenido desde el 2000 hasta el 2023, el seria el que tendría mayor cantidad de puntos</li>
                                                                                                           </ul>"
                                                                                                                 
                              )
                              )
                      ),
                      ####BIBLIOGRAFIA####
                      tabItem("Bibliografía",
                              box(width = 12, status = "info", background = "navy", title = "Bibliografía",
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
  output$grafico11<-renderPlotly({grafico.D.11})
  output$logoUCV<-renderImage({return(list(src = "www/logoUCV.png"), content_type = "image/png")})
  output$logoEECA<-renderImage({return(list(src = "www/logoEECA.png"), content_type = "image/png")})
  output$CDM<-renderImage({return(list(src = "www/Coeficientes del modelo.png"), content_type = "image/png")})
  output$CRC<-renderImage({return(list(src = "www/Correlacion y R cuadrado.png"), content_type = "image/png")})
  
}


shinyApp(ui,server)
