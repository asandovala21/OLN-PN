* indicadores  : Número y Distribución
* subpoblación : ocupados
* según        : año (2010-2015), mes (2 5 8 11), tramo de edad
* agregaciones : "tramo de edad"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion _tramo_edad_v1""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _ocupado == 1"
  .tabla.over      = "_tramo_edad_v1"
  .tabla.aggregate = "_tramo_edad_v1"
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_ocupado _tramo_edad_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-02-01", replace

* indicadores  : Número y Distribución
* subpoblación : desocupados
* según        : año (2010-2015), mes (2 5 8 11), tramo de edad
* agregaciones : "tramo de edad"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion _tramo_edad_v1""'
  .tabla.masks     = `""n desocupados" "% desocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _desocupado == 1"
  .tabla.over      = "_tramo_edad_v1"
  .tabla.aggregate = "_tramo_edad_v1"
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_desocupado _tramo_edad_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-02-02", replace
