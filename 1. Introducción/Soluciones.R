# Limpiamos el directorio de trabajo.
rm(list=ls())

# Realizamos las primeras operaciones.
25.3 + 35.1
15 - 8.2
12 * 4
15 / 3
125^(1/2)
2^8

# Creamos las variables.
a = 25.3 + 35.1
b = 15 - 8.2
c = 12 * 4
d = 15 / 3
e = 125^(1/2)
f = 2^8

# Creamos los vectores.
p = 20:127
q = c(5,12,25,8,46,52)
r = c(35:80,10:100)
s = c("a","b","c","d","e",1,2,3,4,5)

# Realizamos las tareas pedidas.
length(p)
length(q)
length(r)
length(s)

# Seleccionamos los elementos del primer vector.
p2=p[1:5]

# Excluimos los 100 primeros elementos.
p3=p[-c(1:100)]

# Seleccionamos aquellos que sean mayores que 99.
p4=p[p>=99]

# Determinamos la clase
class(p)
class(s)

# Cambiamos el formato.
q=as.character(q)

# Creamos la lista.
Lista = list(nombres=c("Borja","Marie","Elena","Jose","Paco"), Edad = c(30,30,25,50,15), altura = c(165,170,185,150))
Lista

# Mostramos los atributos.
attributes(Lista)
names(Lista)

# Mostramos el segundo elemento de la lista.
Lista[2]

# Mostramos el cuarto elemento.
Lista[[2]][4]

# Mostramos el quinto elemento de la primera variable.
Lista[[1]][5]

# Creamos la matriz pedida.
matriz <- matrix(c(1,2,3,4, 11,12,13,14, 21,22,23,25),
               nrow = 4, ncol = 4, byrow = TRUE,
               dimnames = list(c("row1", "row2", "row3","row4"),
                               c("V1", "V2", "V3","V4")))

# Extraemos los atributos.
attributes(matriz)

# Seleccionamos las dos primeras filas.
matriz[c(1,2),]

# Seleccionamos las dos primeras columnas.
matriz[,c(1,2)]

# Seleccionamos las dos primeras filas y las dos primeras columnas.
matriz[c(1,2),1:3]

# Adimos una nueva columna.
matriz = cbind(matriz, rnew=c(3,9,27,3^4))

# Adimos una nueva fila.
matriz = rbind(matriz, rnew=c(2,4,6,8,10))
           
# Creamos el factor.
Notas = factor(c("SS", "AP", "NT", "SB", "MH"))

# Mostramos los distintos niveles.
levels(Notas)

# Mostramos el tercer nivel.
levels(Notas)[3]

# Sustituimos NT por Notable.
levels(Notas)[3] = "Notable"

# Creamos el Data Frame.
Datos <- data.frame(Jugador=c("Huertas","Granger","Vildoza","Tadas"), Equipo=c("Baskonia","Baskonia","Baskonia","Baskonia"), Especialidad=c("Base","Base","Base","Alero"), As=c(36,27,22,19) )

# Nuemro de filas.
nrow(Datos)

# Numero de columnas.
ncol(Datos)

# Dimensiones.
dim(Datos)

# Cambiamos el nombre.
colnames(Datos) = c("Nombre", "Team", "Especialidad", "As")

# Seleccionamos a los mayores de 25.
Mayores = Datos[Datos$As > 25,]

# Menores de 25 y mayores de 20
Jovenes = Datos[Datos$As<25 & Datos$As>20,]

# Menores de 25 y Base.
Base_Joven = Datos[Datos$Especialidad == "Base" & Datos$As<25,]

# Menores de 25 o Base.
Base_Joven = Datos[Datos$Especialidad == "Base" | Datos$As<25,]

# Creamos las funciones.
# Area del circulo.
AreaCirculo = function(r) {pi*r^2}
AreaCirculo(5)

# Area del rectangulo
AreaRectangulo = function(b,a) {b*a}
AreaRectangulo(5,3)

# Ecuación de segundo grado.
Ecuacion = function(a,b,c,x) {a*x^2+b*x+c}
Ecuacion(3,4,5,6)

# Perímetro circunferencia.
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
