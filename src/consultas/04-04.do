* Macros auxiliares
local id "04-04"
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
	.table.along      = "`var' _cise_v1"
	.table.aggregate  = "{`var'} {_cise_v1} {`var' _cise_v1}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_cise_v1 `var' _ocupado"

  * Estimación
	.table.create
	save "$proyecto/data/consultas/`id' [`i'].dta", replace
}
