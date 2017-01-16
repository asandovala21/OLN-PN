* indicadores  : número y distribución
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : región de residencia (región)
* según        : categoría ocupacional (cise)
* agregaciones : "región", "cise", "región y cise"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""total _counter" "proportion _cise_v1""'
  .table.masks     = `""n ocupados" "% ocupados""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.rowvar    = "_cise_v1"
  .table.colvar    = "_region_re_v1"
  .table.aggregate = `""_cise_v1" "_region_re_v1" "_cise_v1 _region_re_v1""'
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_cise_v1 _ocupado _region_re_v1"
  cls

* Estimación
.table.create
save "$proyecto/data/tabla 03-06", replace

* Exportación
.table.export_excel bh,  ///
  file("tabla 03-07") rowvar("_region_re_v1") colvar("año")
