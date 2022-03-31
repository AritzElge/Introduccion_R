# 0. Primero borramos las variables:
#################################

rm(list=ls())

# 1. Cargar los datos
#####################

datos <- read.csv("Ejemplo_4.csv",header = TRUE,sep = ";")

# 2. Mostrar los datos
######################

show(datos)

# 3. Realizar un resumen estadístico de los datos
#################################################

summary(datos)

# 4. Comprobar si la fecha está en un formato correcto
######################################################

sapply(datos, class)

# 5. En caso de que la fecha no esté correcta transformarla al formato correcto
###############################################################################

datos$CET <- as.Date(as.character(datos$CET), format="%d/%m/%Y")

# 6. Comprobar que la transformación se ha hecho de forma correcta
##################################################################

sapply(datos, class)

# 7. Crear una nueva variable que extraiga el año de la fecha
#############################################################

#Primer se obtiene la fecha:
date <-  as.Date(datos$CET,'%d-%m-%Y')
date

#Después se separa el año de la fecha:
fecha_año <- as.numeric(format(date,'%Y'))
fecha_año

# 8. Crear una nueva variable que extraiga el mes de la fecha
#############################################################

fecha_mes <- as.numeric(format(date, '%m'))
fecha_mes

# 9. Crear una nueva variable que extraiga el día de la fecha
#############################################################

fecha_dia <- as.numeric(format(date, '%d'))
fecha_dia

# 10. Realizar un gráfico de la temperatura máxima en función 
# de los años y ver si existen diferencias a lo largo de los años
#################################################################

plot(fecha_año, datos$Max.TemperatureC)

# 11. Realizar un gráfico de la temperatura máxima en función de 
# los meses y analizar si existen diferencias entre los meses
################################################################

plot(fecha_mes, datos$Max.TemperatureC)

# 12. Realizar un gráfico de la temperatura máxima en función de los
# días y ver si existen diferencias según el día
####################################################################

plot(fecha_dia, datos$Max.TemperatureC)

# 13. Extraer el día de la semana
#################################

datos$dia_semana <- weekdays(as.Date(datos$CET))

# 14. Crear una variable que determine si se está en fin de semana o no
#######################################################################

datos$finDeSemana = "Sí"
datos$finDeSemana[datos$dia_semana == "sábado"] = "No"
datos$finDeSemana[datos$dia_semana == "domingo"] = "No"

# 15. Realizar un gráfico en de la temperatura máxima en función de si
# se está en fin de semana o no
######################################################################

datos$finDeSemana = as.factor(datos$finDeSemana)
sapply(datos, class)

plot(datos$finDeSemana,datos$Max.TemperatureC)

# 16. Calcular la media de la temperatura máxima los fines de semana y 
# entre semana
######################################################################

#Se crea un vector con sólo los datos de temperatura maxima en finde
datosFinde <- datos$Max.TemperatureC[datos$finDeSemana == "Sí"]

# Se comprueba que el número de datos en datosFinde concuerda con el numero SI:
table(datos$finDeSemana)

# Se calcula la media haciendo mean
mean(datosFinde, na.rm = TRUE)

#Se crea otro vector con sólo los datos de temp. maxima fuera de finde
datosEntreSemana = datos$Max.TemperatureC[datos$finDeSemana == "No"]
# Se comprueba el numero de datos

table(datos$finDeSemana)
# Se calcula la media

mean(datosEntreSemana, na.rm = TRUE)
