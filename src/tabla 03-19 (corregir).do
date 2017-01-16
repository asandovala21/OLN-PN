* indicadores  : escolaridad promedio (años)
* subpoblación : ocupados conmutantes
* años         : 2010 2015
* meses        :
* por          : región de residencia (region)
* según        :
* agregaciones : "region"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""mean _esc""'
  .table.masks     = `""escolaridad promedio (años)""'
  * Dominios
  .table.years     = "2010 2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if (_ocupado == 1) & (_conmutante_v1 == 1)"
  .table.rowvar    = "_region_re_v1"
  .table.colvar    = ""
  .table.aggregate = "_region_re_v1"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_conmutante_v1 _esc _ocupado _region_re_v1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-19", replace

* Exportación
.table.export_excel bh,  ///
  file("tabla 03-19") rowvar("_region_re_v1") colvar("año")
