rm(list=ls())

datos=read.csv("trainmod.csv")


# Mostramos los datos.
show(datos)

# Resumen estadistico.
summary(datos)

# Mostramos los niveles.
levels(datos$Crisis)

# Realizamos la sustitucion
levels(datos$Crisis)[1]="Crisis"
levels(datos$Crisis)[2]="Burbuja"

# Comprobamos la clase
sapply(datos,class)

# Grafico del precio de venta.
plot(datos$SalePrice)


# Grafico de dispersion del precio de venta.
hist(datos$SalePrice)

# Grafico del precio de venta en funcion de la calle.
plot(datos$MSZoning, datos$SalePrice)

# Graficamos la relacion entre SalePrice y GrLiveArea.
plot(datos$SalePrice,datos$GrLivArea)

# Grafico de la variable MSZonning.
plot(datos$MSZoning)

# Seleccionamos los datos numericos.
datosNum=datos[,sapply(datos,is.numeric)]

# Graficamos todas las relaciones entre las variables.
library(PerformanceAnalytics)
chart.Correlation(datosNum,hist=T)

# Seleccionamos las diez ultimas variables.#0. Limpiamos el espacio de trabajo
###################################

rm(list=ls())

# 1. Cargar los datos de Train.
##############################
#Cargar el CSV.

datos = read.csv("trainmod.csv")

# 2. Mostrar los datos
######################

show(datos)

# 3. Realizar un resumen estadístico de los datos y realizar una interpretación
###############################################################################

summary(datos)

# 4. Determinar los niveles existentes para la variable "Crisis".
#################################################################

datos$crisis = as.factor(datos$Crisis)
levels(datos$Crisis)

# 5. Sustituir los "Si" por "Crisis" y los "No" por "Burbuja". 
##############################################################

datos$Crisis[datos$Crisis=="Si"] = "Crisis"
datos$Crisis[datos$Crisis=="No"] = "Burbuja"

# 6.  Determinar la clase de cada uno de los datos
##################################################

sapply(datos, class)

# 7. Realizar un gráfico del precio de venta
############################################

plot(datos$SalePrice)

# 8. Realizar un histograma del precio de venta
###############################################

hist(datos$SalePrice,main = "Precio de venta", xlab = "Precio de venta", ylab = "Frecuencia", col= "blue")

# 9.  Graficar el precio de venta en función de la variable MSZoning
####################################################################
datos$MSZoning = as.factor(datos$MSZoning)
plot(datos$SalePrice,datos$MSZoning)

# 10. Mostrar, gráficamente la relación entre el precio de venta y "GrLivArea".
#¿Como es?.
#¿Y la relación con "LotArea"?. 
###############################################################################

plot(datos$SalePrice,datos$GrLivArea)

plot(datos$SalePrice,datos$LotArea)

# 11. Realizar un gráfico de la variable "MSZoning". 
###################################################
plot(datos$MSZoning)

# 12. Seleccionar los datos numéricos. 
######################################

datosNum=datos[,sapply(datos,is.numeric)]

# 13. Graficar todas las relaciones entre las variables.
########################################################

library(PerformanceAnalytics)
chart.Correlation(datos,hist=T)

# 14. Crear un nuevo Data Frame con las 10 últimas variables. 
#############################################################

#inicio <- ncol(datos)-9
#fin <- ncol(datos)
#ultimos10 = datos[, inicio:fin]

ultimos10 = datos[, (ncol(datos)-9):(ncol(datos))]

# 15. Analizar la relación de estas variables con dos gráficos diferentes
#########################################################################
library(corrplot)

chart.Correlation(ultimos10,hist=T)

#corrplot(cor(datosNum10), method="ellipse", shade.col=NA, tl.col="black", 
#         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")

# 16. Analizar la correlación entre las variables numéricas
###########################################################

datosNum10 = ultimos10[,sapply(ultimos10,is.numeric)]

corrplot(cor(datosNum10), method="color", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")


# 17. Eliminar los valores perdidos. 
####################################

datosNuma<-datosNum[complete.cases(datosNum),]

# 18. Volver a analizar la correlación realizando tres tipos de dibujos diferentes.
###################################################################################

corrplot(cor(datosNum), method="ellipse", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")

corrplot(cor(datosNum), method="number", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")

corrplot(cor(datosNum), method="color", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")

# 19. Guardar los datos. 
########################

write.csv(datosNum, "trainmod_num.csv", row.names=FALSE)
datosNum2=datosNum[,29:38]

# Graficamos las relaciones de estas diez variables.
library(PerformanceAnalytics)
chart.Correlation(datosNum2,hist=T)

# La segunda opcion.
library(psych)
pairs.panels(datosNum2)

# Analizamos la correlacion.
library(corrplot)
corrplot(cor(datosNum), method="shade", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=FALSE, cl.pos="n")

# Eliminamos los Valores perdidos.
datosNuma<-datosNum[complete.cases(datosNum),]

# Graficamos las correlaciones con todos los dibujos posibles.
corrplot(cor(datosNuma), method="shade", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=FALSE, cl.pos="n")

corrplot(cor(datosNuma), method="circle", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")

corrplot(cor(datosNuma), method="square", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")

corrplot(cor(datosNuma), method="ellipse", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")

corrplot(cor(datosNuma), method="number", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")

corrplot(cor(datosNuma), method="color", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")

corrplot(cor(datosNuma), method="pie", shade.col=NA, tl.col="black", 
         tl.srt=45, addgrid.col="black", type="lower", diag=TRUE, cl.pos="n")

write.csv(datos,"trainmod.csv",row.names=FALSE)
