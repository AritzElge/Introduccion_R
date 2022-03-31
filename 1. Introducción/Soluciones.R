# El primer paso, siempre, es limpiar nuestro area de trabajo.
rm(list=ls())

# 1.Realizar las siguientes operaciones
#######################################

# Sumar
25.3+35.1
# Restar
15-8.2
# Multiplicar
12*4
# Dividir
15/3
# Raíz Cuadrada
125^(1/2)
#sqrt(125)
 #Elevar a una potencia
2^8

# 2.Crear Variables con las operaciones del ej. 1:
##################################################

a=25.3+35.1
b=15-8.2
c=12*4
d=15/3
e=sqrt(125)
f=2^8

# 3.Crear los siguientes vectores:
##################################

i <- 20:127                 # del 20 al 127
j <- c(5,12,25,8,46,52)     # que incluya numeros concretos
k <- c(35:80,10:100)        # del 35 al 80 y del 10 al 100
l <- c("a","b","c","d","e",1:5)

# 4.Realizar las siguientes tareas con vectores
###############################################

# Determinar el numero de elementos de cada vector creado en el ej. 3:
length(i)
length(j)
length(k)
length(l)
# Crear otro vector seleccionando los primeros 5 elementos del primer vector:
i_prima <- i[1:5]
# Crear otro vector excluyendo los 100 primeros elementos del primer vector:
i_duo <- i[-c(1:100)]
# Crear un nuevo vector con los datos del primer vector mayores o iguales que 99:
i_tri <- i[i >= 99]
# Determinar la clase del primer vector creado en el ej.3 y el ej. 4:
class(i)
class(i_prima)
# Transformar la clase del segundo vector a texto:
j <- as.character(j)
class(j)

# 5.Crear las siguientes listas y realizar las siguientes tareas:
#################################################################

# Crear una lista con los nombres de 5 personas, su edad y su altura
miLista <- list(nombre=c("Pablo","Manolo","Sofia","Lucía","Galio"), altura=c(169,175,150,143,130),edad=c(34,33,18,42,12))
miLista
# Mostrar de dos formas diferentes los atributos de la lista
miLista["edad"]
miLista[3]
# Mostrar el segundo elemento de la lista
miLista[2]
# Mostrar el cuarto valor de ese elemento
miLista[[2]][4]
# Mostrar el último elemento de la primera variable
# Recordar: ¡El doble corchete se utiliza para llamar vectores dentro de una lista!
miLista[[1]][length(miLista[[1]])] 

# 6.Crear una matriz de 4x4 y realizar las siguientes tareas:
#############################################################

matriz_4x4 <- matrix(c(1,2,3,4, 11,12,13,14, 21,22,23,24),
               nrow = 4, ncol = 4, byrow = TRUE)
               
# Mostrar la matriz en la consola.
matriz_4x4
# Extraer los atributos.
attributes(matriz_4x4)
# Crear una nueva matriz con las dos primeras filas.
matriz_2f <- matriz_4x4[c(1:2),]
matriz_2f
# Crear una nueva matriz con las dos primeras columnas.
matriz_2c <- matriz_4x4[,c(1:2)]
matriz_2c
# Crear una nueva matriz con las dos primeras filas y las tres primeras columnas.
matriz_2y3 <- matriz_4x4[c(1:2),c(1:3)]
matriz_2y3
# Añadir una nueva columna.
matriz_2y3 <- cbind(matriz_2y3, 0)
# Añadir una nueva fila.
matriz_2y3 <- rbind(matriz_2y3, 0)

# 7. Crear un factor con las notas que se pueden sacar 
# en la Universidad (SS, AP, NT, SB y MH) y realizar 
# las siguientes tareas:
######################################################
notas_Universidad <- factor(c("SS", "AP", "NT", "SB", "MH"), levels=c("SS", "AP", "NT", "SB", "MH"))
notas_Universidad
# Calcular el número de opciones existentes.
nlevels(notas_Universidad)
# Mostrar los distintos niveles.
levels(notas_Universidad)[1:5]
# Mostrar el tercer nivel.
levels(notas_Universidad)[3]
# Sustituir "NT" por "Notable".
levels(notas_Universidad)[3] <- "Notable"

# 8. Crear un DataFrame de 4 variables (Nombre del Jugador, 
# Equipo, Posición y Edad) y 8 observaciones (Jugadores) y 
# realizar las siguientes tareas:
misdatos <- data.frame(nombre=c("Juan","Maria","Leticia","Jaime","Olatz","Pedro","Jorge","Lorena"),
                    equipo=c("ATH","ATH","ATH","ATH","ATH","ATH","ATH","ATH"),
                    Posicion=c("Delantero","Defensa","Defensa","Centrocampista","Delantero","Defensa","Delantero","Portero"),
                    edad=c(21:28))
# Visualizarlo por consola.
misdatos
# Contar el número de filas.
nrow(misdatos)
# Contar el número de columnas.
ncol(misdatos)
# Calcular las dimensiones.
dim(misdatos)
# Cambiar el nombre de las variables a (Nombre, Team, Especialidad y Años).
colnames(misdatos) <- c("Nombre","Team", "Especialidad","Años")
# Seleccionar aquellos jugadores mayores de 25 años.
misdatos[misdatos$Años > 25,]
# Seleccionar aquellos jugadores de menos de 25 años y mayores de 20.
misdatos[misdatos$Años < 25 & misdatos$Años > 20,]
# Seleccionar aquellos jugadores de menos de 25 años y que tengan una especialidad
# determinada (según los jugadores creados).
misdatos[misdatos$Años < 25 & misdatos$Especialidad == "Portero"]
# Seleccionar aquellos jugadores de menos de 25 años o que tengan una especialidad
# determinada (según los jugadores creados).
misdatos[misdatos$Años < 25 & misdatos$Especialidad == "Defensa"]

# 9. Crear las siguientes funciones: 
####################################

# Determine el área de un círculo.
AreaCirculo = function(r) {pi*r^2}
AreaCirculo(5)
# Determine el área de un rectángulo.
AreaRectangulo = function(b,a) {b*a}
AreaRectangulo(5,3)
# Resuelva una ecuación de segundo grado.
Ecuacion = function(a,b,c,x) {a*x^2+b*x+c}
Ecuacion(2,5,4,6)

# Determine el perímetro de una circunferencia.
Perimetro = function(r) {2*pi*r}
Perimetro(5)

# Creamos la condicion.
letra="y"
if(letra == "a"){
  print("Vocal")
} else if (letra=="e") {
  print("Vocal")
} else if (letra=="i") {
  print("Vocal")
} else if (letra=="o") {
  print("Vocal")
} else if (letra=="u") {
  print("Vocal")
} else if (letra=="y") {
  print("Y Griega")
} else{
  print("Consonante")
}
