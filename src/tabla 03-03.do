* indicadores  : Número y Distribución
* subpoblación : ocupados
* según        : año (2010-2015), mes (2 5 8 11), nivel educacional
* agregaciones : "tramo de edad"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion _educ""'
  .tabla.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _ocupado == 1"
  .tabla.over      = "_educ"
  .tabla.aggregate = "_educ"
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_ocupado _educ"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-03-01", replace

* indicadores  : Número y Distribución
* subpoblación : desocupados
* según        : año (2010-2015), mes (2 5 8 11), nivel educacional
* agregaciones : "tramo de edad"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Estadísticas
  .tabla.cmds      = `""total _counter" "proportion _educ""'
  .tabla.masks     = `""n desocupados" "% desocupados""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _desocupado == 1"
  .tabla.over      = "_educ"
  .tabla.aggregate = "_educ"
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_desocupado _educ"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-03-02", replace
