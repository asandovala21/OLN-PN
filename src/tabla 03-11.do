* indicadores  : distribución de ocupados
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : cise (distinguiendo tipo de contrato)
* según        : sector
* agregaciones : "sector", "cise", "sector, cise"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""proportion _rama1_v1""'
  .table.masks     = `""%""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.rowvar    = "_cise_v2"
  .table.colvar    = "_rama1_v1"
  .table.aggregate = `""_rama1_v1" "_cise_v2" "_cise_v2 _rama1_v1""'
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_cise_v2 _ocupado _rama1_v1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-11", replace

* Exportación
.table.export_excel bh, ///
  file("tabla 03-11") rowvar("_rama1_v1") colvar("_cise_v2")
