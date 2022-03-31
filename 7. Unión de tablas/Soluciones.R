# 0. Limpiamos el espacio de trabajo
####################################

rm(list=ls())

# 1. Cargar los datos "SalePrice1", "SalePrice2", "SalePrice3"
##############################################################

#Cargar los datos de SalePrice1:
datosPrice1 = read.csv("SalePrice1.csv",header = TRUE,sep = ",")

#Cargar los datos de SalePrice2:
datosPrice2 = read.csv("SalePrice2.csv",header = TRUE,sep = ",")

#Cargar los datos de SalePrice3:
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

# 5. Cargar datosH
##################

datosH = read.csv("datosH.csv",header = TRUE,sep = ",")

# 6. Realizar las siguientes uniones con dos funciones:
#######################################################

#     a.  Enriquecer datos H con la información de “SalePrice1”,
#         “SalePrice2”, “SalePrice3”.
################################################################

#     b.  Recogiendo toda la información recogida en todas las tablas
#####################################################################

#     c.  Recogiendo los elementos comunes.
###########################################

# 7. Seleccionar:
#################

#     a.  Los elementos comunes entre datosH y Casascaras
##########################################################

#     b.  Enriquecer datosH con Casascaras
##########################################

#     c.  Enriquecer Casascaras con datos H
###########################################

#     d.  Todos los elementos
#############################
