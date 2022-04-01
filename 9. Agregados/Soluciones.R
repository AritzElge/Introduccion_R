# 0. Limpiamos el espacio de trabajo
####################################

rm(list=ls())

# 1. Cargar "trainmod"
######################

# Cargamos el csv:
datos=read.csv("trainmod.csv",stringsAsFactors = TRUE)

# Revisamos los datos:
summary(datos)

# 2. Agregar el Precio de Venta en función de la variable MSZoning.
# Calculando:
###################################################################
# a. Importe Total de las transacciones                           #
#######################################                           #
                                                                  #
Tipo = aggregate(SalePrice~MSZoning,data = datos,sum)             #
                                                                  #
# b. Número total de transacciones                                #
##################################                                #
                                                                  #
CountTipo = aggregate(SalePrice~MSZoning,data = datos,length)     #
                                                                  #
# c. Valor medio de las transacciones                             #
#####################################                             #
                                                                  #
MeanTipo = aggregate(SalePrice~MSZoning,data = datos,mean)        #
                                                                  #
# d. Desviación típica de las transacciones                       #
###########################################                       #
                                                                  #
DesvTipo = aggregate(SalePrice~MSZoning,data = datos,sd)          #
###################################################################

# 3. Agregar el Precio de venta en función de la variable MSZoning
# y la variable Crisis. Calculando:
#######################################################################
# a. Importe Total de las transacciones                               #
#######################################                               #
                                                                      #
Tipo2 = aggregate(SalePrice~MSZoning+Crisis,data = datos,sum)         #
                                                                      #
# b. Número total de transacciones                                    #
##################################                                    #
                                                                      #
CountTipo2 = aggregate(SalePrice~MSZoning+Crisis,data = datos,length) #
                                                                      #
# c. Valor medio de las transacciones                                 #
#####################################                                 #
                                                                      #
MeanTipo2 = aggregate(SalePrice~MSZoning+Crisis,data = datos,mean)    #
                                                                      #
# d. Desviación típica de las transacciones                           #
###########################################                           #
                                                                      #
DesvTipo2 = aggregate(SalePrice~MSZoning+Crisis,data = datos,sd)      #
#######################################################################

# 4. Graficar de las agregaciones anteriores el importe Total
# y el número Total de transacciones, de la siguiente forma:
#   a. Valor en el eje de la Y
#   b. MSZoning en el eje X
#   c. Color en función de si se vendió en la crisis o fuera de ella
####################################################################

library(ggplot2) # <-- Para graficar

ggplot(Tipo,aes(x=MSZoning,y=SalePrice)) + 
  ggtitle("Importe Total") + 
  geom_bar(stat="identity")


ggplot(CountTipo,aes(x=MSZoning,y=SalePrice)) + 
  ggtitle("Número Total de transacciones") + 
  geom_bar(stat="identity")

# 5. Unir las tablas "Valor Medio" y "Desviación Típica" calculadas
# en el punto 2.
###################################################################

# Unir tablas mediante "pegado":
datosUnidos=cbind(MeanTipo, DesvTipo$SalePrice)

# 6. Cambiar los nombres de las variables de la tabla anterior y poner
# Media y Desviacion.
######################################################################

# Revisamos la tabla nueva:
summary(datosUnidos)

# Cambiamos el primer SalePrice por Media
# y el segundo SalePrice por Desviacion:
colnames(datosUnidos) <- c("MSZoning", "Media", "Desviacion")

# Comprobamos el resultado
summary(datosUnidos)

# 7. Calcular el cociente entre Media y Desviación
##################################################

datosUnidos$cociente = "XXX"
datosUnidos$cociente = datosUnidos$Media/datosUnidos$Desviacion
