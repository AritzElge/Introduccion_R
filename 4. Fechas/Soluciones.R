# Limpiamos el directorio de trabajo.
rm(list=ls())

# Cargamos los datos.
datos=read.csv("Ejemplo_4.csv",sep=";")

# Mostramos los datos
show(datos)

# Realizamos un resumen estadistico de los datos.
summary(datos)

#Comprobamos el tipo de dato de la fecha.
class(datos$CET)

# Lo transformamos en formato fecha.
datos$CET <- as.POSIXct(as.character(datos$CET), format="%d/%m/%Y")

# Comprobamos que el cambio se ha realizado correctamente.
class(datos$CET)

# Extraemos el a.
library(lubridate)
datos$ano <- year(datos$CET)

# Extraemos el mes.
datos$mes <- month(datos$CET)

# Extraemos el dia.
datos$dia <- day(datos$CET)

# Dibujamos la temperatura maxima en funcion del a.
plot(datos$ano,datos$Max.TemperatureC)

# Dibujamos la temperatura maxima en funcion del mes.
plot(datos$mes,datos$Max.TemperatureC)

# Dibujamos la temperatu maxima en funcion del dia.
plot(datos$dia,datos$Max.TemperatureC)


# Creamos un subconjunto de datos con julio y agosto.
Verano=datos[datos$mes==7 | datos$mes==8,]

# Graficamos en funcion del a.
plot(Verano$ano,Verano$Max.TemperatureC)


# Extraemos el dia de la semana.
datos$diasemana = weekdays(as.Date(datos$CET))

# Separamos el sabado y el domingo.
datos$finde = 0
datos$finde[datos$diasemana == "s畸ado" | datos$diasemana == "domingo"]=1

#Graficamos en funcion del dia de la semana.
plot(datos$finde,datos$Max.TemperatureC)

# Calculamos la media del finde
datos$Max.TemperatureC=as.numeric(datos$Max.TemperatureC)
mediafinde=mean(datos$Max.TemperatureC[datos$finde==1],na.rm=TRUE)
mediasemana=mean(datos$Max.TemperatureC[datos$finde==0],na.rm=TRUE)
