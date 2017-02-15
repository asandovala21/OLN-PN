* Macros auxiliares
local id "04-03"

* Loop principal
local i = 0
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 2) continue

	* Especificación
	.table = .ol_table.new
  .table.cmds       = "{total _counter} {proportion _razon_inactividad}"
  .table.cmds_lb    = "{N} {%}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{Ocupados}"
	.table.by         = "_razon_inactividad"
	.table.along      = "`var'"
	.table.aggregate  = "{_razon_inactividad}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_ocupado `var' _razon_inactividad"

  * Estimación
	.table.create
	save "$proyecto/data/consultas/`id' [`i'].dta", replace
}
