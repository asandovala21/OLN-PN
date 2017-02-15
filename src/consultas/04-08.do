* Macros auxiliares
local id "04-08"
local varlist "_mujer _discapacitado _indigena _joven _inmigrante"

* Loop principal
local i = 0
foreach var in `varlist' {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 2) continue

  * Especificación
  .table = .ol_table.new
  .table.cmds       = "{total _counter}"
  .table.cmds_lb    = "{N}"
  .table.years      = "2015"
  .table.months     = ""
  .table.subpops    = "{_ocupado}"
  .table.subpops_lb = "{Ocupados}"
  .table.by         = ""
  .table.along      = "_mujer _oficio1"
  .table.aggregate  = "{_mujer} {_oficio1} {_mujer _oficio1}"
  .table.src        = "casen"
  .table.from       = "$datos"
  .table.varlist0   = "_mujer _ocupado _oficio1"

  * Estimación
	.table.create
	save "$proyecto/data/consultas/`id' [`i'].dta", replace
}
