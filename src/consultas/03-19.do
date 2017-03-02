* Macros auxiliares y objetos temporales
local id "03-19"
local lb1 "{1: Entran a la región}"
local lb2 "{2: Salen de la región}"
local i = 1
tempfile df

* BBDD (inicialización)
drop _all
save `df', emptyok

* Loop principal
foreach var in "_region_re_v1" "_region_tr_v1" {
  * Especificación
  .table = .ol_table.new
  .table.cmds       = "{mean _esc}"
  .table.cmds_lb    = "{1: Escolaridad promedio}"
  .table.cmds_fmt   = "{%15,1fc}"
  .table.years      = "2016"
  .table.months     = "2 5 8 11"
  .table.subpops    = "{if (_conmutante_v1 == 1)}"
  .table.subpops_lb = "`lb`i''"
  .table.by         = ""
  .table.along      = "`var'"
  .table.margins    = "{`var'}"
  .table.margins_lb = "{Nacional}"
  .table.src        = "ene"
  .table.from       = "$datos"
  .table.varlist0   = "_conmutante_v1 _esc `var'"

  * Estimación
  .table.create
  .table.annualize
  .table.add_asterisks

  * Ajustes finales
  rename `var' region
  label variable region "Región"

  * Anexión
  append2 using `df'
  save `df', replace
  local ++i
}

save "$proyecto/data/consultas/`id'.dta", replace
