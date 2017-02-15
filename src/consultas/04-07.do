* Macros auxiliares
local id "04-07"

* Loop principal
local i = 0
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 2) continue

	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{proportion _rama1_v1}"
	.table.cmds_lb    = "{%}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{Ocupados}"
	.table.by         = "_rama1_v1"
	.table.along      = "`var'"
	.table.aggregate  = "{`var'} {_rama1_v1} {`var' _rama1_v1}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "`var' _ocupado _rama1_v1"

  * Estimación
	.table.create
	save "$proyecto/data/consultas/`id' [`i'].dta", replace
}
