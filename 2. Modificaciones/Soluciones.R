# Limpiamos el directorio de trabajo
rm(list=ls())

# Cargamos los datos.
datos=read.csv("train.csv")

# Covierto en texto
datos$MSZoning = as.character(datos$MSZoning)    

# Realizamos el cambio.
datos$MSZoning = gsub("(all)", "", datos$MSZoning)  
datos$MSZoning = as.factor(datos$MSZoning)
levels(datos$MSZoning)

# Utilizando las "\\" realizamos la correcion final. 
datos$MSZoning = as.character(datos$MSZoning) 
datos$MSZoning = gsub("\\()", "", datos$MSZoning)  
datos$MSZoning = as.factor(datos$MSZoning)
levels(datos$MSZoning)

datos$MSZoning = as.character(datos$MSZoning) 
datos$MSZoning = gsub(" ", "", datos$MSZoning)  
datos$MSZoning = as.factor(datos$MSZoning)
levels(datos$MSZoning)


# Creamos una nueva variable llamada crisis
datos$Crisis="XXX"

# Transformamos la variable.
datos$Crisis[datos$YrSold<2008]="No"
datos$Crisis[datos$YrSold>=2008]="Si"

# Comprobamos.
table(datos$Crisis)

CasasCaras = datos[order(datos$SalePrice,decreasing=TRUE)[1:10],]

datos$Street[which.max(datos$SalePrice)]

datos$Reforma=datos$YrSold-datos$YearRemodAdd


write.csv(datos,"trainmod.csv", row.names=FALSE)
