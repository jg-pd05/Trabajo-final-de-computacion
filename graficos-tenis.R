####Paquetes para los graficos#####
library(readxl)
library(ggplot2)
library(plotly)
library(dplyr)
library(esquisse)
library(grid)
library(e1071)
install.packages("grid")
installed.packages("httr")
installed.packages("shiny")
installed.packages("shinydashboard")
installed.packages("esquisse")
installed.packages("tidyverse")
installed.packages("ggplot2")
installed.packages("plotly")
installed.packages("dplyr")
install.packages("e1071")

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

dataframe.ED1 <- data.frame(
  Minimo = c("4"),
  Cuartil.1 = c("1006"),
  Mediana = c("1690"),
  Media = c("2448"),
  Cuartil.3 = c("2875"),
  Maximo = c("16950"),
  Des.Estandar = c("2381.3"),
  Simetria = c("2.41"),
  Curtosis = c("6.85") )

est.PuntosRank <- summary(dataframe_tenis$winner_rank_points)
Var.PuntosRank <- var(dataframe_tenis$winner_rank_points, na.rm = TRUE)
DesEstandar.PuntosRank <- sqrt(5670576)
Sim.PuntosRank <- skewness(dataframe_tenis$winner_rank_points, na.rm = TRUE)
Cur.PuntosRank <- kurtosis(dataframe_tenis$winner_rank_points, na.rm = TRUE )

dataframe.ED2 <- data.frame(
  Minimo = c("170"),
  Cuartil.1 = c("183"),
  Mediana = c("185"),
  Media = c("186"),
  Cuartil.3 = c("190"),
  Maximo = c("206"),
  Des.Estandar = c("7.05"),
  Simetria = c("0.41"),
  Curtosis = c("0.15") )

est.altura <- summary(dataframe_tenis$winner_ht)
Var.altura <- var(dataframe_tenis$winner_ht, na.rm = TRUE)
DesEstandar.altura <- sqrt(49.73896)
Sim.altura <- skewness(dataframe_tenis$winner_ht, na.rm = TRUE)
Cur.altura <- kurtosis(dataframe_tenis$winner_ht, na.rm = TRUE )

dataframe.ED3 <- data.frame(
  Minimo = c("15"),
  Cuartil.1 = c("23"),
  Mediana = c("26"),
  Media = c("25.86"),
  Cuartil.3 = c("29"),
  Maximo = c("39"),
  Des.Estandar = c("7.05"),
  Simetria = c("0.3"),
  Curtosis = c("-0.39") )

est.edad <- summary(dataframe_tenis$winner_age)
Var.edad <- var(dataframe_tenis$winner_age, na.rm = TRUE)
DesEstandar.edad <- sqrt(17.97481)
Sim.edad <- skewness (dataframe_tenis$winner_age, na.rm = TRUE)
Cur.edad <- kurtosis (dataframe_tenis$winner_age, na.rm = TRUE)

dataframe.ED4 <- data.frame(
  Minimo = c("0"),
  Cuartil.1 = c("1"),
  Mediana = c("2"),
  Media = c("2.77"),
  Cuartil.3 = c("4"),
  Maximo = c("17"),
  Des.Estandar = c("2.34"),
  Simetria = c("1.37"),
  Curtosis = c("2.72") )

est.faltas <- summary(dataframe_tenis$w_df)
Var.faltas <- var(dataframe_tenis$w_df, na.rm = TRUE)
DesEstandar.faltas <- sqrt(5.46527)
Sim.faltas <- skewness (dataframe_tenis$w_df, na.rm = TRUE)
Cur.faltas <- kurtosis (dataframe_tenis$w_df, na.rm = TRUE)

dataframe.ED5 <- data.frame(
  Minimo = c("0"),
  Cuartil.1 = c("3"),
  Mediana = c("6"),
  Media = c("7.31"),
  Cuartil.3 = c("10"),
  Maximo = c("113"),
  Des.Estandar = c("5.87"),
  Simetria = c("2.48"),
  Curtosis = c("21.71") )

est.aces <- summary(dataframe_tenis$w_ace)
Var.aces <- var(dataframe_tenis$w_ace, na.rm = TRUE)
DesEstandar.aces <- sqrt(34.5152)
Sim.aces <- skewness (dataframe_tenis$w_ace, na.rm = TRUE)
Cur.aces <- kurtosis (dataframe_tenis$w_ace, na.rm = TRUE)

dataframe.ED6 <- data.frame(
  Minimo = c("0"),
  Cuartil.1 = c("57"),
  Mediana = c("73"),
  Media = c("78.62"),
  Cuartil.3 = c("95"),
  Maximo = c("491"),
  Des.Estandar = c("29.69"),
  Simetria = c("1.33"),
  Curtosis = c("7.23") )

est.PtServicio <- summary(dataframe_tenis$w_svpt)
Var.PtServicio <- var(dataframe_tenis$w_svpt, na.rm = TRUE)
DesEstandar.PtServicio <- sqrt(881.4402)
Sim.PtServicio <- skewness (dataframe_tenis$w_svpt, na.rm = TRUE)
Cur.PuntosRank <- kurtosis (dataframe_tenis$w_svpt, na.rm = TRUE)

#Correlaciones

Correlacion1 <- lm(dataframe_tenis$PG ~ dataframe_tenis$winner_age) 
summary(Correlacion1)
sqrt(8.444e-05) #La correlacion es igual a 0.92%
#No hay casi carrelacion entre los partidos ganados y la edad de los tenistas

dataframe.ED7 <- data.frame(
  Cor.Pearson.PG_aces = "16.67%",
  R.cuadrado = "2.78%",
  Coe.A = "261.5749",
  Coe.B = "9.2613")

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











