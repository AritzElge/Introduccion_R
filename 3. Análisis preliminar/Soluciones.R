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

# Seleccionamos las diez ultimas variables.
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
