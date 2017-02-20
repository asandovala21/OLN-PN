* Genera las consultas 0x-03, x = 4, ..., 7
local i = 3
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 5) continue

	* Especificación
	.table = .ol_table.new
  .table.cmds       = "{total _counter} {proportion _razon_inactividad}"
  .table.cmds_lb    = "{N} {%}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _inactivo == 1}"
.table.subpops_lb = "{Inactivos}"
	.table.by         = "_razon_inactividad"
	.table.along      = "`var'"
	.table.aggregate  = "{_razon_inactividad}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_inactivo `var' _razon_inactividad"

  * Estimación
	.table.create
	local file "0`i'-03"
	save "$proyecto/data/consultas/`file'.dta", replace
}
