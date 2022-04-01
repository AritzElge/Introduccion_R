# 0. Limpiamos el espacio de trabajo
####################################

rm(list=ls())

# 1. Cargar los datos "SalePrice1", "SalePrice2", "SalePrice3"
##############################################################

# Cargar los datos de SalePrice1:
datosPrice1 = read.csv("SalePrice1.csv",header = TRUE,sep = ",")

# Cargar los datos de SalePrice2:
datosPrice2 = read.csv("SalePrice2.csv",header = TRUE,sep = ",")

# Cargar los datos de SalePrice3:
datosPrice3 = read.csv("SalePrice3.csv",header = TRUE,sep = ",")

# 2. Unir las tres tablas "pegando" una a continuación de otra
##############################################################

datosPrice=cbind(datosPrice1, datosPrice2, datosPrice3)

# 3. Cargar los datos de “CasasCaras”
#####################################

datosCaras = read.csv("CasasCaras.csv",header = TRUE,sep = ",")

# 4. Enriquecer la tabla “CasasCaras” con las variables incluidas en datos1, 
# datos2 y datos3, utilizando dos fórmulas diferentes.
############################################################################

# Formula 1: Utilizando merge
EstrellaEnriquecidos=merge(datosCaras,datosPrice,all.x=TRUE ,all.y=FALSE)

# Formula 2: utilizando la libr. plyr (join)
library(plyr)
JoinIzquierda=join(datosCaras,datosPrice,type="left")

# 5. Cargar datosH
##################

datosH = read.csv("datosH.csv",header = TRUE,sep = ",")

# 6. Realizar las siguientes uniones con dos funciones:
#######################################################

#     a.  Enriquecer datosH con la información de “SalePrice1”,
#         “SalePrice2”, “SalePrice3”.
################################################################

# Formula 1: Utilizando merge
EstrellaEnriquecidos=merge(datosH,datosPrice,all.x=TRUE ,all.y=FALSE)

# Formula 2: utilizando la libr. plyr (join)
JoinIzquierda=join(datosH,datosPrice,type="left")

#     b.  Recogiendo toda la información recogida en todas las tablas
#####################################################################

# Formula 1: Utilizando merge
EstrellaEnriquecidos=merge(datosH,datosPrice,all.x=FALSE ,all.y=FALSE)

# Formula 2: utilizando la libr. plyr (join)
JoinIzquierda=join(datosH,datosPrice,type="full")

#     c.  Recogiendo los elementos comunes.
###########################################

# Formula 1: Utilizando merge
EstrellaEnriquecidos=merge(datosH,datosPrice,all.x=TRUE ,all.y=TRUE)

# Formula 2: utilizando la libr. plyr (join)
JoinIzquierda=join(datosH,datosPrice,type="inner")

# 7. Seleccionar:
#################

#     a.  Los elementos comunes entre datosH y Casascaras
#########################################################

comunes=join(datosH,datosCaras,type="inner")

#     b.  Enriquecer datosH con Casascaras
##########################################

enr_H_con_caras=join(datosH,datosCaras,type="left")

#     c.  Enriquecer Casascaras con datos H
###########################################

enri_caras_con_H=join(datosH,datosCaras,type="right")

#     d.  Todos los elementos
#############################

todos=join(datosH,datosCaras,type="full")
