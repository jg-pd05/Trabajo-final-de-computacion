####Paquetes para los graficos#####
library(ggplot2)
library(plotly)
library(dplyr)

####estadisticas####
est.altura <- summary(dataframe_tenis$winner_ht)
est.edad <- summary(dataframe_tenis$winner_age)
est.faltas <- summary(dataframe_tenis$w_df)
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

#grafico de barras para la participacion de los jugadores en torneos por cada pais 

grafico.5 <- ggplot(dataframe_tenis) +
  aes(x = winner_ioc, colour = winner_ioc) +
  geom_bar(fill = "#112446") +
  scale_color_viridis_d(option = "plasma", 
                        direction = 1) +
  labs(x = "Paises", y = "Participacion total de jugadores en torneos", title = "Participacion total de los tenistas por paises", 
       subtitle = "En torneos de nivel \"M\" y \"G\"") +
  theme_linedraw() +
  theme(legend.position = "none") +
  theme(plot.title = element_text(size = 16L, 
                                  face = "bold.italic"), plot.subtitle = element_text(size = 9L, face = "italic"))

#relacion entre las faltas de los jugadores y su edad


library(ggplot2)

ggplot(dataframe_tenis) +
 aes(x = winner_age, y = w_df) +
 geom_jitter(size = 1L, shape = "circle small", 
 colour = "#5C31DB") +
 labs(x = "Edades", y = "Faltas", title = "Faltas en relacion a las edades") +
 theme_linedraw() +
 theme(axis.title.y = element_text(face = "italic"), axis.title.x = element_text(face = "italic"))






