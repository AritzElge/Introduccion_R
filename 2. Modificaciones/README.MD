# EJERCICIOS DE MODIFICIACIONES BÁSICAS EN R

1. Cargar los datos de train.csv

2. Para la variable “MSZoning” eliminar de la variable “C (all)” el “ (all)” (sustituirlo por
“”).

3. Comprobar que se ha realizado correctamente el cambio.

4. En caso de que no se haya realizado correctamente solucionarlo.

5. Crear una nueva variable que se llame Crisis.

6. Transformar la variable anterior para determinar (Debe tomar los valores Sí y No),
basándose en la variable “YrSold”, si la casa se vendió en el periodo precrisis (antes
de 2008) o durante la crisis (a partir de 2008).

7. Comprobar que se ha realizado correctamente.

8. Crear un nuevo grupo de datos con las 10 casas más caras, en función de la
variable “SalePrice”.

9. Determinar la calle en la que se encuentra la casa más cara.

10. Crear una variable llamada “Reforma” y que muestre los años que pasaron entre la
última reforma y la venta (YrSold-YearRemodAdd).

11. Guardar los datos, write.csv(datos, “trainmod.csv”, row.names=FALSE).
