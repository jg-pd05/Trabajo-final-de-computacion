# Análisis de cualidades del jugadores de tenis del top 10, un enfoque estadistico

 Proyecto 

 Que hace el proyecto

1. Recopilación de Datos: Se recopilan datos detallados sobre los jugadores, incluyendo estadísticas de partidos, características físicas, entre otras variable.

2. Evaluación del Rendimiento: Se analizan variable como jugador, paìs o torneo. ¿Como se comportan las estadìsticas por paìses? ¿En qué superficies juegan mejor? ¿Cómo se desempeñan en diferentes situaciones de juego?

3. Anàlisis de Resultados: Se utilizan técnicas estadísticas para observar como se comportan unas variables con respecto a otras y determinar si existe suficiente relaciòn entre ellas para predecir resultados de una con respecto a la otra.

Utilidad

Este proyecto tiene la intenciòn de aportar una visiòn estadistica a los resultados de los jugadores entre el 2000 y 2023. Adicionalmente se visualizan diversos datos de interes en las vistas creads en SQLite. 


 Funcionamiento 

 Lo primero que se hizo en el repositorio fué hacer resolver las preguntas del cuestionario, estos códigos corren de forma completa y arrojan como resultado tablas que van a depender de las preguntas a responder. 

 Luego se subieron commits con respecto a la depuración de la base de datos, donde se eliminaron campos que no iban a ser tomdas en cuenta, además de transformsa algunas columnas con datos reales a enteros y se colocó corrctamentel tipo de dato corespondiente a las fechas. Se creo la tabla llamada Tourney para quitar algunos campos referente a torneos en la tabla Matches. Además de seleccionar solo solo partidos que se hayan efectuado a partir del año 2000. Y se eliminaron datos que no correspondian al top 10 del ranking.

 Se creó la conexión de la base de datos usada para la investigación con el lenguaje de programación estadístico R. Además de crear los dataframes correspendientes a las tablas. 
 Posterior a esto se decidió crear una muestra  que solo tomara en cuenta torneos de nivel G y M para realizar el análisis de los datos, la tabla de la muestra fué creada con SQLite.

 Los primeros gráficos en R se crearon con las librerias ggplot2, plotly y dplyr. 


 Con respecto a power bi se crearon tablas para optimizar y mejora la visualización de los datos. Se crearon 6 visualizaciones con el objetivo de resumir el proyecto y que dicho resumen sea atrayente para la audiciencia.

 Tecnologías empleadas

 R: Lenguaje de programación estadístico.
 SQLite: Gestor de base de datos.
 Power Bi: Servicio de análisis de daatos de Microsoft.

 Objetivos

- Analizar la relación entre los Aces marcados y los Partidos Ganados.
- Describir las características de los jugadores en el top 10.
- Comparar el rendimiento de los jugadores en diferentes superficies.
- Observar la relación entre distintas variables

 

 
 
