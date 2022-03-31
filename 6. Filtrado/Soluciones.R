# 0. Limpiamos el espacio de trabajo
####################################

rm(list=ls())

# 1. Cargar los datos de "trainmod"
###################################

# Cuidado con el separador. En este caso es una "coma":
datosTrain = read.csv("trainmod.csv",header = TRUE,sep = ",")

# Antes de continuar conocemos los datos:
summary(datosTrain)
sapply(datosTrain, class)

# 2. Seleccionar los datos en los que la variable "MSZoning" tome el valor "RM"
###############################################################################

RM_en_MSZoning = datosTrain[datosTrain$MSZoning == "RM",]

# 3. Seleccionar los datos en los que la variable "MSZoning" tome el valor "RM"
# o "C".
###############################################################################

RM_o_C_en_MSZoning = datosTrain[datosTrain$MSZoning == "RM" | datosTrain$MSZoning == "C",]

# 4. Seleccionar los datos en los que el precio de venta sea menor
# de 100.000$
##################################################################

SalePrice_menor_cienMil = datosTrain[datosTrain$SalePrice < 100000,]

# 5. Seleccionar los datos en los que el precio de venta sea menor
# de 100.000$ o la variable "MSZoning" tome el valor "RM".
##################################################################

SalePrice_menor_cienMil_o_RM = datosTrain[datosTrain$SalePrice < 100000 | datosTrain$MSZoning == "RM",]

# 6. Seleccionar los datos en los que el precio de venta sea menor
# de 100.000$ y la variable "MSZoning" tome el valor "RM".
##################################################################

SalePrice_menor_cienMil_y_RM = datosTrain[datosTrain$SalePrice < 100000 & datosTrain$MSZoning == "RM",]

# 7. Seleccionar los datos de la variable "MSZoning" que no tomen el valor "RL"
###############################################################################

not_RL_en_MSZoning = datosTrain[datosTrain$MSZoning != "RL",]

# 8. Seleccionar los datos de la variable "MSZoning" que no tomen el valor "RL"
# y valgan menos de 120.000 dolares.
###############################################################################

not_RL_en_MSZoning_y_menor_cientoVeinteMil = datosTrain[datosTrain$SalePrice < 120000 & datosTrain$MSZoning != "RL",]

# 9. Seleccionar las variables que sean factores
################################################

# Revisamos el tipo de datos con el que trabajamos
sapply(datosTrain,class)

# Seleccionamos los factores:
Factores=datosTrain[,sapply(datosTrain,is.factor)]
Factores=as.data.frame(Factores)
# No hay factores en este dataFrame
# datosFactores=datosTrain[,Factores]

# 10. Eliminar aquellas varibales que tomen solo un valor
#########################################################

# Revisamos los datos:
summary(datosTrain)

# Seleccionamos las variables que toman un sólo valor:
#Configurable cambiando el número al final de la primera línea
criterio = apply(datosTrain,2,function(x) length(unique(na.omit(x)))) > 1
seleccion = datosTrain[,criterio]

# 11. Eliminar los duplicados
#######################################################################
                                                                      #
rep = duplicated(datosTrain)                                          #
table(rep)                                                            #
# No hay duplicados, por lo tanto no es necesario eliminar nada aquí  #
                                                                      #
# 12. De los datos seleccionar las variables que aparecen en datosImp #
##################################################################### #
                                                                      #
# Cargamos datosImp.csv:                                              #
datosImp <- read.csv("datosImp.csv",header = TRUE,sep = ",")          #
                                                                      #
# Revisamos datosImp:                                                 #
summary(datosImp)                                                     #
                                                                      #
# Es una fila por lo que filtramos por filas:                         #
rowTrain=rownames(datosTrain)                                         #
B=datosTrain[0:83,]                                                   #
rowImp=rownames(datosImp)                                             #
                                                                      #
# Filtramos:                                                          #
datosTrain_filtrado1=datosTrain[!rowTrain %in% rowImp,]               #
                                                                      #
# 13. De los datos seleccionar aquellos que aparecen en casas caras   #
###################################################################   #
                                                                      #
datosCaras <- read.csv("CasasCaras.csv",header = TRUE,sep = ",")      #
# Es una columna por lo que filtramos por columnas                    #
                                                                      #
colTrain=colnames(datosTrain)                                         #
colCaras=colnames(datosCaras)                                         #
                                                                      #
# Filtramos:                                                          #
datosTrain_filtrado2=datosTrain[!colTrain %in% colCaras]              #
                                                                      #
# Filtramos el anteriormente filtrado:                                #
####################################################################  #
colTrain=colnames(datosTrain_filtrado1)                            #  #
colCaras=colnames(datosCaras)                                      #  #
                                                                   #  #
# Filtramos:                                                       #  #
datosTrain_filtrado3=datosTrain_filtrado1[!colTrain %in% colCaras] #  #
####################################################################  #
#######################################################################
