INTRODUCCIÓN A R - TEORÍA

# El primer paso, siempre, es limpiar nuestro area de trabajo.

rm(list=ls())

# Lo primero que podemos hacer es realizar una serie de calculos simples.

1+1
5-4
3*8
25/5


# A continuacion creamos una serie de variables.

x <- 1
y <- x + 1

# Tambien las podemos visualizar en la consola.

y

# Tambien podemos crear vectores.

z<-1:20

# Igualmente podemos visualizarlo.

z

# Otro vector con los numeros deseados.

x <- c(10,20,30,40,50)
x

# Contamos los elementos del vector

length(x)

# Podemos crear un nuevo vector que contenga solo unos datos del anterior.

y <- x[1:3]
y

# Con el simbolo "-" excluimos datos.
# En este caso lo realizamos segun su posicion.
# Eliminamos los tres primeros datos.

z <- x[-c(1:3)]
z

# Tambien podemos seleccionar los datos que cumplan una determinada condicion.

b <- x[ x > 37]
b


# Tambien podemos crear vectores que incluyan numeros y letras.

y<-c("a",1)
y

# Vemos el tipo de datos que contienen la "X" y la "Y"

class(x)
class(y)


# Uno es numerico y otro son caracteres es decir lo considera texto.

# Le pedimos que nos muestre los elementos que hemos creado.

ls()

# Podemos crear un vector con varios grupos de datos.

x<-c(1:5,1:5)

# Tambien podemos cambiar el formato de los datos.
x <- as.character(x)
x

# El texto aparece entre comillas.

# Otra opcion es crear listas.
# Tambien las podemos visualizar.

mylist <- list(name="Fred", wife="Mary",no.children=3,child.ages=c(4,7,9))
mylist

# O realizar consultas

attributes(mylist)
names(mylist)

# Le pedimos que nos muestre los elementos deseados.
# Puede ser por el nuemro de la variable.
# Tambien por el nombre de esta.

mylist[4]
mylist["child.ages"]

# Mostramos un elemento de una variable.
mylist[[4]][1]


# Ahora creamos matrices de datos.

mdat <- matrix(c(1,2,3, 11,12,13, 21,22,23),
               nrow = 3, ncol = 3, byrow = TRUE,
               dimnames = list(c("row1", "row2", "row3"),
                               c("V1", "V2", "V3")))

# Y las mostramos en la consola.

mdat

# O le hacemos consultas

attributes(mdat)


# Igualmente podemos mostrar ciertos datos.

# Por filas.
mdat[c(1,3),]

# Por columnas.
mdat[,c(1,3)]

# Adimos nuevos elementos a una matriz ya creada.
# Y lo vemos en la consola

# Adimos una fila

mdat <- rbind(mdat, rnew=0)
mdat

# O una columna

mdat <- cbind(mdat, new=5)
mdat


# El siguiente elemento son factores.
# Le indicamos los niveles.
# Lo visualizamos

y <- factor(c("V","M","M","M","M","V"), levels=c("V","M"))
y

# Mostramos los diferentes elementos existentes.
# Vemos su orden.

nlevels(y)
levels(y)
levels(y)[1]
levels(y)[2]

# Una vez que conocemos su orden podemos cambiar el nombre

levels(y)[1]<-"Varon"
levels(y)[2]<-"Mujer"
y

# Comprobamos.

nlevels(y)
levels(y)
levels(y)[1]
levels(y)[2]


# El ultimo elemento son los Data Frames.
# Creamos un data frame

mydata <- data.frame(x=c(1,11,21), y=c(20,30,40), z=c("Juan","Maria","Leticia") )

# Lo visualizamos

mydata

# Contamos el numero de filas y de columnas

nrow(mydata)
ncol(mydata)

# Vemos las dimensiones

dim(mydata)

# Tambien podemos cambiar los nombres de las variables

colnames(mydata)<-c("ntrans","edad","nombre")
j=mydata[,colnames(mydata)=="ntrans"]

# Vemos sus caracteristicas
str(mydata)

# Filtramos datos.
# Con un criterio
mydata[mydata$ntrans>3,]

# Que cumpla dos croterios simultaneamente
mydata[mydata$ntrans>3 & mydata$nombre=="Maria",]

# La "!" excluye a quien cumpla esa condicion
mydata[mydata$ntrans>3 & mydata$nombre!="Juan",]

# Tambien podemos hacer que cumpla una condicion solo.

mydata[mydata$nombre=="Maria" | mydata$nombre=="Leticia",]

# Asi no cumple ninguna condicion

mydata[mydata$nombre=="Maria" & mydata$nombre=="Leticia",]


# Creacion de funciones.

# Creamos una funcion que eleve al cuadrado.
Cuadrado = function(x) {x^2}

# La aplicamos.
Cuadrado(2)

# Creamos una funcion que calcule el area de un triangulo.
AreaTriangulo = function (a,b) {a*b/2}

# La aplicamos.
AreaTriangulo(5,4)


# Condicionales.

# Si el numero es mayor que 0 devolver positico.
x <- 5
if(x > 0){
  print("Positivo")
}

# Si el numero es mayor que 0 devolver positivo y si es menor negativo.
x <- -2
if(x > 0){
  print("Positivo")
} else{
  print("Negativo")
}

# Devolver:
  # Si el numero es mayor que 0: positivo.
  # Si es igual a 0 neutro.
  # Si es menor que 0 negativo.

x <- -1
if(x > 0){
  print("Positivo")
} else if (x==0) {
  print("Neutro")
} else{
  print("Negativo")
}

EJERCICIOS de INTRODUCCIÓN A LA PROGRAMACIÓN EN R

1- Realizar las siguientes operaciones:
● Sumar 25,3 y 35,1.
● Restar 15 menos 8,2.
● Multiplicar 12 por 4.
● Dividir 15 entre 3.
● Calcular la raíz cuadrada de 125.
● Elevar 2 a la 8.

2- Crear variables con las operaciones del ejercicio 1:
● a
● b
● c
● d
● e
● f

3- Crear los siguientes vectores:
● Un vector que vaya del 20 al 127.
● Un vector que incluya los números 5, 12, 25, 8, 46 y 52.
● Un vector que vaya del 35 al 80 e incluya a continuación el 10 y el 100.
● Crear un vector con las 5 primeras letras del abecedario y los 5 primeros números
enteros.

4- Realizar las siguientes tareas con vectores:
● Determinar el número de elementos de cada vector creado en el punto 3.
● Crear otro vector seleccionando los primeros 5 elementos del primer vector.
● Crear otro vector excluyendo los primeros 100 elementos del primer vector.
● Crear un nuevo vector con los datos del primer vector mayores o iguales que 99.
● Determinar la clase del primer vector creado en el ejercicio 3 y del cuarto.
● Transformar la clase del segundo vector a texto.

5- Crear las siguientes listas y realizar las siguiente tareas:
● Crear una lista con los nombres de 5 personas, su edad y su altura.
● Mostrar de dos formas diferentes los atributos de la lista.
● Mostrar el segundo elemento de la lista.
● Mostrar el cuarto valor de ese elemento..
● Mostrar el último elemento de la primera variable.

6- Crear una matriz de 4x4 y realizar las siguientes tareas:
● Mostrar la matriz en la consola.
● Extraer los atributos.
● Crear una nueva matriz con las dos primeras filas.
● Crear una nueva matriz con las dos primeras columnas.
● Crear una nueva matriz con las dos primeras filas y las tres primeras columnas.
● Añadir una nueva columna.
● Añadir una nueva fila.

7- Crear un factor con las notas que se pueden sacar en la Universidad (SS, AP, NT, SB y
MH) y realizar las siguientes tareas:
● Calcular el número de opciones existentes.
● Mostrar los distintos niveles.
● Mostrar el tercer nivel.
● Sustituir “NT” por “Notable”.

8- Crear un DataFrame de 4 variables (Nombre del Jugador, Equipo, Posición y Edad) y 8
observaciones (Jugadores) y realizar las siguientes tareas:
● Visualizarlo por consola.
● Contar el número de filas.
● Contar el número de columnas.
● Calcular las dimensiones.
● Cambiar el nombre de las variables a (Nombre, Team, Especialidad y Años).
● Seleccionar aquellos jugadores mayores de 25 años.
● Seleccionar aquellos jugadores de menos de 25 años y mayores de 20.
● Seleccionar aquellos jugadores de menos de 25 años y que tengan una especialidad
determinada (según los jugadores creados).
● Seleccionar aquellos jugadores de menos de 25 años o que tengan una especialidad
determinada (según los jugadores creados).

9- Crear las siguientes funciones:
● Determine el área de un círculo.
● Determine el área de un rectángulo.
● Resuelva una ecuación de segundo grado.
● Determine el perímetro de una circunferencia.

10- Crear una condicion que determine si una letra es vocal o consonante o si se trata de la
Y griega.
