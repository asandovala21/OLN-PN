* Macros auxiliares
local id "04-04"

* Loop principal
local i = 0
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 2) continue

	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{proportion _cise_v3}"
	.table.cmds_lb    = "{%}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{Ocupados}"
	.table.by         = "_cise_v3"
	.table.along      = "`var'"
	.table.aggregate  = "{`var'} {_cise_v3} {`var' _cise_v3}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_cise_v3 `var' _ocupado"

  * Estimación
	.table.create
	save "$proyecto/data/consultas/`id' [`i'].dta", replace
}
