* indicadores  : escolaridad promedio
* subpoblación : ocupados
* años         : 2010 y 2015
* meses        :
* por          : región
* según        : dirección de la conmutanción
* agregaciones : "region"
* fuente       : ENE

* Preparativos
drop _all
tempfile df
save `df', emptyok

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""mean _esc""'
  .table.masks     = `""escolaridad promedio (años)""'
  * Dominios
  .table.years     = "2010 2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if (_ocupado == 1) & (_conmutante_v1 == 1)"
  .table.by        = ""  // (init)
  .table.along     = ""
  * Estructura
  .table.rowvar    = ""  // (init)
  .table.colvar    = ""  // (init)
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_conmutante_v1 _esc _ocupado _region_re_v1 _region_tr_v1"

* Estimación
local i = 1
foreach var in _region_re_v1 _region_tr_v1 {
  * Especificación (act)
  .table.by        = "`var'"
  .table.aggregate = "`var'"

  * Estimación
  .table.create
  .table.annualize

  * Anexión
  generate dir = `i'
  rename `var' _region_v1
  append using "`df'", nolabel
  save "`df'", replace
  local ++i
}

* Etiquetado (valores)
label define dir 1 "Salen de la región" 2 "Entran a la región", modify
label values dir dir

* Etiquetas (variables)
label variable dir "Dirección de la conmutación"
label variable _region_v1 "Región"

* Guardado
save "$proyecto/data/tabla 03-19", replace

* Exportación
.table.rowvar = "_region_v1"
.table.colvar = "año dir"
.table.export_excel bh, file("tabla 03-19")
