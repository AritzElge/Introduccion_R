datos=read.csv("train2.csv")

# Mostramos los niveles.
levels(datos$LotConfig)

# Y el numero de elementos.
table(datos$LotConfig)

# Creamos el diccionario.
correcto=c("Corner","CulDSac","FR2","FR3","Inside")

# Creamos la nueva variable.
library(stringdist)
match = amatch(datos$LotConfig,correcto,maxDist=4)
corregidos = correcto[match]
res = cbind.data.frame(datos$LotConfig,corregidos)

# Corregimos en train2.
datos=cbind(datos,res$corregidos)
datos$LotConfig=NULL
names(datos)[names(datos)=="res$corregidos"]="LotConfig"

# Comprobamos.
levels(datos$LotConfig)
table(datos$LotConfig)

# Cargamos los datos originales.
datos2=read.csv("train.csv")
levels(datos2$LotConfig)
table(datos2$LotConfig)

# Vemos que los cambios los ha hecho correctamente.
