# Instalar paquete RSQLite
install.packages("RSQLite")

# Cargar el paquete

library(RSQLite)
library(DBI)
library(dplyr)
# Conectar a la base de datos SQLite 

con <- dbConnect(RSQLite::SQLite(), dbname = "database.sqlite")


# Obtiene la lista de tablas en la base de datos
tablas <- dbListTables(con)
print(tablas)


### Crear dataframes

dataframe_matches <- dbReadTable(con, "Matches")
dataframe_Tourney <- dbReadTable(con, "Tourney")
dataframe_players <- dbReadTable(con, "players")
dataframe_rankings <- dbReadTable(con, "rankings")



