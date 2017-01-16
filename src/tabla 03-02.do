* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2010 y 2015
* meses        : 2 5 8 11
* por          : tramo de edad
* según        :
* agregaciones : "tramo de edad"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""total _counter" "proportion _tramo_edad_v1""'
  .table.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.by        = "_tramo_edad_v1"
  .table.along     = ""
  .table.aggregate = "_tramo_edad_v1"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_ocupado _tramo_edad_v1"
  cls

* Estimación
.table.create
save "$proyecto/data/tabla 03-02-01", replace

* Exportación
.table.export_excel bh,  ///
  file("tabla 03-07") rowvar("_region_re_v1") colvar("año")



* indicadores  : Número y Distribución
* subpoblación : desocupados
* según        : año (2010-2015), mes (2 5 8 11), tramo de edad
* agregaciones : "tramo de edad"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""total _counter" "proportion _tramo_edad_v1""'
  .table.masks     = `""n desocupados" "% desocupados""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _desocupado == 1"
  .table.over      = "_tramo_edad_v1"
  .table.aggregate = "_tramo_edad_v1"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_desocupado _tramo_edad_v1"
* Estimación
.table.create
save "$proyecto/data/tabla 03-02-02", replace
