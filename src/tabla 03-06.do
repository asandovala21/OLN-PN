* indicadores  : distribución
* subpoblación : ocupados
* años         : 2015
* meses        :
* por          : categoría ocupacional (cise)
* según        : región de residencia (región)
* agregaciones : "cise", "región", "región x cise"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""proportion _cise_v3""'
  .table.masks     = `""%""'
  * Dominios
  .table.years     = "2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if _ocupado == 1"
  .table.by        = "_cise_v3"
  .table.along     = "_region_re_v1"
  .table.aggregate = `""_region_re_v1" "_cise_v3" "_cise_v3 _region_re_v1""'
  * Estructura
  .table.rowvar    = "_region_re_v1"
  .table.colvar    = "_cise_v3"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_cise_v3 _ocupado _region_re_v1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-06", replace

* Exportación
.table.export_excel bh, file("tabla 03-06")
