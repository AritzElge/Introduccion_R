# 0. Borramos lo anterior
#########################

rm(list=ls())

# 1.  Cargar los datos de "train2". 
##################################

datos <- read.csv("train2.csv")

# 2. Mostrar los niveles de la variable "LotConfig". 
####################################################
datos$LotConfig = as.factor(datos$LotConfig)
levels(datos$LotConfig)

# 3.  Mostrar el número de elementos de cada nivel. 
###################################################
table(datos$LotConfig)

# 4. Crear un diccionario con los términos correctos
####################################################
#   a) Corner
#   b) CulDSac
#   c) FR2
#   d) FR3
#   e) Inside
library(stringdist)
correcto = c("Corner","CulDSac","FR2","FR3","Inside")

# 5. Crear una variable que corrija los errores topográficos
# existentes, permitirle un máximo de 4 cambios de letras
############################################################

match = amatch(datos$LotConfig, correcto, maxDist=4)
corregidos = correcto[match]
res = cbind.data.frame(datos$LotConfig, corregidos)

# 6. Corregir los errores en la tabla train2
############################################

datos=cbind(datos,res$corregidos)
datos$LotConfig=NULL
names(datos)[names(datos)=="res$corregidos"]="LotConfig"
datos$LotConfig = as.factor(datos$LotConfig)

# 7. Comprobar que se ha realizado correctamente
################################################

table(datos$LotConfig)
levels(datos$LotConfig)
