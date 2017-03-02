* Macros auxiliares y objetos temporales
local id "03-01"
local lb1 "1: Edad promedio"
local lb2 "2: Escolaridad promedio"
local lb3 "3: Educación superior completa (%)"
local lb4 "4: Mujeres (%)"
tempfile df
local i = 1

* df (inicialización)
drop _all
save `df', emptyok

* Loop principal
foreach var in "_edad" "_esc" "_superior_completa" "_mujer" {
  * Especificación
  .table = .ol_table.new
  .table.cmds       = "{total _counter}"
  .table.cmds_lb    = "{0: }"
  .table.cmds_fmt   = "{%15,1fc}"
  .table.years      = "2010 2011 2012 2013 2014 2015 2016"
  .table.months     = "2 5 8 11"
  .table.subpops    = "{if _ocupado == 1}"
  .table.subpops_lb = "{1: Ocupados}"
  .table.by         = "`var'"
  .table.along      = ""
  .table.margins    = ""
  .table.margins_lb = ""
  .table.src        = "ene"
  .table.from       = "$datos"
  .table.varlist0   = "_ocupado `var'"
  if (`i' <= 2) .table.cmds_lb = "{`lb`i''}"
  if (`i' <= 2) .table.cmds    = "{mean `var'}"
  if (`i' <= 2) .table.by      = ""

  * Estimación
  .table.create
  .table.annualize
  if (`i' >= 3) .table.add_proportions, cmd_lb("`lb`i''") cmd_fmt("%15,1fc")
  if (`i' >= 3) keep if (cmd_lb == `i') & (`var' == 1)
  if (`i' >= 3) drop `var'
  .table.add_asterisks
  append2 using `df'
  save `df', replace
  local ++i
}
save "$proyecto/data/consultas/`id'.dta", replace
