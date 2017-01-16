* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2010 y 2015
* meses        : 2 5 8 11
* por          : nivel educacional
* según        :
* agregaciones : "tramo de edad"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""total _counter" "proportion _educ""'
  .table.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.rowvar    = "_educ"
  .table.colvar    = ""
  .table.aggregate = "_educ"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_ocupado _educ"
  cls

* Estimación
.table.create
save "$proyecto/data/tabla 03-03-01", replace

* Exportación
.table.export_excel bh,  ///
  file("tabla 03-07") rowvar("_region_re_v1") colvar("año")



* indicadores  : Número y Distribución
* subpoblación : desocupados
* según        : año (2010-2015), mes (2 5 8 11), nivel educacional
* agregaciones : "tramo de edad"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""total _counter" "proportion _educ""'
  .table.masks     = `""n desocupados" "% desocupados""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _desocupado == 1"
  .table.over      = "_educ"
  .table.aggregate = "_educ"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_desocupado _educ"
* Estimación
.table.create
save "$proyecto/data/tabla 03-03-02", replace
