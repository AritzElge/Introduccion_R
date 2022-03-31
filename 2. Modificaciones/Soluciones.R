#0. Limpiamos el espacio de trabajo
###################################

rm(list=ls())

# 1. Cargar los datos de Train
##############################

#Cargar el CSV.
datos = read.csv("train.csv")

# 2. Para la variable "MSZoning" eliminar de la variable
#"C (all)" el " (all)" (sustituirlo por "")
########################################################

datos$MSZoning = gsub("\\(all)", "", datos$MSZoning)

# 3. Comprobar que se ha realizado correctamente el cambio
##########################################################

table(datos$MSZoning)

# 4. En caso de que no se haya realizado correctamente solucionarlo
###################################################################
# 5. Crear una nueva variable que se llame Crisis
#################################################

datos$Crisis = "XXX"
table(datos$Crisis)

# 6. Transformar la variable anterior para determinar
# (Debe tomar los valores Sí y No),basándose en la
# variable "YrSold", si la casa se vendió en el 
# periodo precrisis (antes de 2008) o durante la crisis (a partir de 2008)
##########################################################################

datos$Crisis[datos$YrSold<2008] = "No"
datos$Crisis[datos$YrSold>=2008] = "Sí"

# 7. Comprobar que se ha realizado correctamente
################################################

table(datos$Crisis)

# 8. Crear un nuevo grupo de datos con las 20 casas más baratas,
# en función de la variable "SalePrice".
###############################################################

#   - Ordenar el dataframe "datos" según la variable 'SalePrice'
#   - Modo creciente                --> decreasing=FALSE
#   - 20 casas por lo que generamos --> [1:20]
datosCasasBaratas = datos[order(datos$SalePrice,decreasing=FALSE)[1:20],]

# 9. Crear una nueva variable y clasificar las observaciones en Grande,
#Mediano y Pequeño según la variable LotArea.
#######################################################################

# Crear la nueva variable
datos$clasificacion = "XXX"
# Mayores o iguales a 9000 = Grandes
datos$clasificacion[datos$LotArea>=9000] = "Grandes"
# Entre 5000 y 9000 = Medianos
datos$clasificacion[datos$LotArea>5000 & datos$LotArea<9000] = "Medianos"
# Menores o iguales a 5000 = Pequeños
datos$clasificacion[datos$LotArea<=5000] = "Pequenos"

# 10. ¿Cuántas casas hay de cada?
#################################

datosGrandes  = datos[datos$clasificacion=="Grandes",]
datosMedianos = datos[datos$clasificacion=="Medianos",]
datosPequenos = datos[datos$clasificacion=="Pequenos",]

nrow(datosGrandes)
nrow(datosMedianos)
nrow(datosPequenos)

# 11. ¿Cual es la media de la variable LotArea para cada una
# de las categorías antes creadas (grande, mediano, pequeño)?
############################################################

mean(datos$LotArea[datos$clasificacion=="Grandes"])
mean(datos$LotArea[datos$clasificacion=="Medianos"])
mean(datos$LotArea[datos$clasificacion=="Pequenos"])

# 12. ¿Y el sumatorio?
######################

sum(datos$LotArea[datos$clasificacion=="Grandes"])
sum(datos$LotArea[datos$clasificacion=="Medianos"])
sum(datos$LotArea[datos$clasificacion=="Pequenos"])

# 13. Crear un nuevo grupo de datos con las 10 casas más caras,
# en función de la variable "SalePrice".
###############################################################

datosCasasMasCaras = datos[order(datos$SalePrice,decreasing=TRUE)[1:10],]

# 14. Determinar la calle en la que se encuentra la casa más cara
#################################################################

datos$Street[which.max(datos$SalePrice)]
datosCasasMasCaras$Street[which.max(datosCasasMasCaras$SalePrice)]

# 10. Crear una variable llamada "Reforma" y que muestre los años
# que pasaron entre la última reforma y la venta (YrSold-YearRemodAdd)
######################################################################

datos$Reforma = datos$YrSold - datos$YearRemodAdd

# 11. Guardar los datos, write.csv(datos, "trainmod.csv", row.names=FALSE)
##########################################################################

write.csv(datos, "trainmod.csv", row.names=FALSE)
