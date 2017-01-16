* indicadores  : número y porcentaje de conmutantes
* subpoblación : ocupados
* años         : 2010 y 2015
* meses        :
* por          : región de residencia (region)
* según        :
* agregaciones : "region"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""total _counter" "proportion _conmutante_v1""'
  .table.masks     = `""n" "%""'
  * Dominios
  .table.years     = "2010 2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if (_ocupado == 1)"
  .table.rowvar    = "_conmutante_v1"
  .table.colvar    = "_region_re_v1"
  .table.aggregate = "_region_re_v1"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_conmutante_v1 _ocupado _region_re_v1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-18", replace

* Exportación
keep if (_conmutante_v1 == 1)
.table.export_excel bh,  ///
  file("tabla 03-18") rowvar("_region_re_v1") colvar("año mask")
