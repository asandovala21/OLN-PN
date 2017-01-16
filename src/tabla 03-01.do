* indicadores  : fracción de mujeres, edad promedio y escolaridad promedio
* subpoblación : ocupados
* años         : 2010-2015
* meses        :
* por          :
* según        :
* agregaciones :
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""mean _mujer" "mean _edad" "mean _esc""'
  .table.masks     = `""fracción mujeres" "edad prom." "escolaridad prom.""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.rowvar    = ""
  .table.colvar    = ""
  .table.aggregate = ""
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_edad _esc _mujer _ocupado"
  cls

* Estimación
.table.create
save "$proyecto/data/tabla 03-01", replace

* Exportación
.table.export_excel bh,  ///
  file("tabla 03-07") rowvar("_region_re_v1") colvar("año")
