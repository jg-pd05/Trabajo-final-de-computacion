####Paquetes para los graficos#####
library(readxl)
library(ggplot2)
library(plotly)
library(dplyr)
installed.packages("httr")
installed.packages("shiny")
installed.packages("shinydashboard")
installed.packages("esquisse")
installed.packages("tidyverse")
installed.packages("ggplot2")
installed.packages("plotly")
installed.packages("dplyr")

####Dataframes####
dataframe_tenis <- read_excel("R/dataframe-tenis.xlsx")
View(dataframe_tenis)

dataframe.grafico.5 <- data.frame (
  Pais = c("ARG", "AUS","AUT","BEL","BRA","BUL","CAN","CHI","CRO","CYP","CZE","DEN","ECU","ESP","FRA",
           "GBR","GER", "GRE", "ITA", "JPN","LAT","NED","NOR","POL","RSA","RUS","SRB","SUI","SWE","THA","USA"),
  Participacion.total = c(409,124,117,71,34,92,147,128,214,52,253,13,43,968,595,
                          222,246,47,150,81,56,8,36,36,86,423,218,291,160,34,527))

####estadisticas####
length(which(dataframe_tenis$winner_ioc == "ARG"))  
length(which(dataframe_tenis$winner_ioc == "AUS"))
length(which(dataframe_tenis$winner_ioc == "AUT"))
length(which(dataframe_tenis$winner_ioc == "BEL"))
length(which(dataframe_tenis$winner_ioc == "BRA"))
length(which(dataframe_tenis$winner_ioc == "BUL"))
length(which(dataframe_tenis$winner_ioc == "CAN"))
length(which(dataframe_tenis$winner_ioc == "CHI"))
length(which(dataframe_tenis$winner_ioc == "CRO"))
length(which(dataframe_tenis$winner_ioc == "CYP"))
length(which(dataframe_tenis$winner_ioc == "CZE"))
length(which(dataframe_tenis$winner_ioc == "DEN"))
length(which(dataframe_tenis$winner_ioc == "ECU"))
length(which(dataframe_tenis$winner_ioc == "ESP"))
length(which(dataframe_tenis$winner_ioc == "FRA"))
length(which(dataframe_tenis$winner_ioc == "GBR"))
length(which(dataframe_tenis$winner_ioc == "GER"))
length(which(dataframe_tenis$winner_ioc == "GRE"))
length(which(dataframe_tenis$winner_ioc == "ITA"))
length(which(dataframe_tenis$winner_ioc == "JPN"))
length(which(dataframe_tenis$winner_ioc == "LAT"))
length(which(dataframe_tenis$winner_ioc == "NED"))
length(which(dataframe_tenis$winner_ioc == "NOR"))
length(which(dataframe_tenis$winner_ioc == "POL"))
length(which(dataframe_tenis$winner_ioc == "RSA"))
length(which(dataframe_tenis$winner_ioc == "RUS"))
length(which(dataframe_tenis$winner_ioc == "SRB"))
length(which(dataframe_tenis$winner_ioc == "SUI"))
length(which(dataframe_tenis$winner_ioc == "SWE"))
length(which(dataframe_tenis$winner_ioc == "THA"))
length(which(dataframe_tenis$winner_ioc == "USA"))

est.PuntosRank <- summary(dataframe_tenis$winner_rank_points)
Var.PuntosRank <- var(dataframe_tenis$winner_rank_points, na.rm = TRUE)
DesEstandar.PuntosRank <- sqrt(5670576)

est.altura <- summary(dataframe_tenis$winner_ht)
Var.altura <- var(dataframe_tenis$winner_ht, na.rm = TRUE)
DesEstandar.altura <- sqrt(49.73896)

est.edad <- summary(dataframe_tenis$winner_age)
Var.edad <- var(dataframe_tenis$winner_age, na.rm = TRUE)
DesEstandar.edad <- sqrt(17.97481)

est.faltas <- summary(dataframe_tenis$w_df)
Var.faltas <- var(dataframe_tenis$w_df, na.rm = TRUE)
DesEstandar.faltas <- sqrt(5.46527)



Correlacion1 <- lm(dataframe_tenis$PG ~ dataframe_tenis$winner_age) 
summary(Correlacion1)
sqrt(8.444e-05) #La correlacion es igual a 0.92%
#No hay casi carrelacion entre los partidos ganados y la edad de los tenistas

Correlacion2 <- lm(dataframe_tenis$PG ~ dataframe_tenis$w_ace) 
summary(Correlacion2)
sqrt (0.02778) #La correlacion es igual a 16.67%
#Hay una mayor correlacion entre los partidos ganados y los aces del ganador, sin embargo, no es suficientemente grande

Correlacion3 <- lm(dataframe_tenis$PG ~ dataframe_tenis$w_df) 
summary(Correlacion3)
sqrt (0.009878) #La correlacion es igual a 9.94%
#Hay una correlacion lineal directa baja entre las dobles faltas y los partidos ganados entre los tenistas 

Correlacion4 <- lm(dataframe_tenis$PG ~ dataframe_tenis$w_bpFaced) 
summary(Correlacion4)
sqrt (0.002664) #La correlacion es igual a 5.16%
#Hay una correlacion lineal directa baja entre los puntos de quiebre enfrentados y los partidos ganados entre los tenistas 

Correlacion5 <- lm(dataframe_tenis$PG ~ dataframe_tenis$w_bpSaved) 
summary(Correlacion5)
sqrt (0.002111) #La correlacion es igual a 4.59%
#Hay una correlacion lineal directa baja entre los puntos de quiebre salvados y los partidos ganados entre los tenistas 

Correlacion6 <- lm(dataframe_tenis$PG ~ dataframe_tenis$winner_ht) 
summary(Correlacion6)
sqrt (0.0007251) #La correlacion es igual a 2.69%
#Hay una correlacion lineal directa baja entre la altura y los partidos ganados entre los tenistas

Correlacion7 <- lm(dataframe_tenis$w_df ~ dataframe_tenis$winner_age)
summary(Correlacion7)
sqrt (0.0004233) #La correlacion es igual a 2.06%
#Hay una correlacion lineal directa baja entre las dobles faltas y la edad de los tenistas


####Graficos####

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

ggplotly(grafico.1)


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

ggplotly(grafico.2)

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
  facet_wrap(vars(winner_hand))

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
  facet_wrap(vars(winner_hand))

#grafico de sectores para la participacion de los jugadores en torneos por cada pais 

grafico.5 <- ggplot(dataframe_tenis) +
  aes(x = winner_ioc, colour = winner_ioc) +
  geom_bar(fill = "#112446") +
  geom_text(stat = 'count', aes(label = scales::percent(..count../sum(..count..))),
            position = position_dodge(width = 0.8), vjust = 0, size = 3, hjust = -0.3) +
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

ggplotly(grafico.6)

#Grafico de dispersion para el modelo de regresion lineal bivariante para los partidos ganados (dependiente) y los aces (independiente)

grafico.7 <- ggplot(dataframe_tenis) +
  aes(x = w_ace, y = PG) +
  geom_jitter(size = 0.6, colour = "#3300EA") +
  geom_smooth(method = "loess", se = TRUE, colour = "#B146E2") +
  labs(x = "Aces", y = "Partidos ganados", 
       title = "Recta de regresion para los partidos ganados en relacio a los aces") +
  theme_linedraw() +
  theme(plot.title = element_text(size = 16L, face = "bold.italic"), axis.title.y = element_text(face = "italic"), 
        axis.title.x = element_text(face = "italic"))

ggplotly(grafico.7)

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
