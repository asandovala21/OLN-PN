* Genera las consultas 0x-05, x = 4, ..., 7
local i = 3
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 5) continue

	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{mean _yprincipal}"
	.table.cmds_lb    = "{M$}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{Ocupados}"
	.table.by         = ""
	.table.along      = "`var' _cise_v1 _educ"
.table.aggregate    = "{_cise_v1} {_educ} {_cise_v1 _educ}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_cise_v1 _educ `var' _ocupado _yprincipal"

  * Estimación
	.table.create
	local file "0`i'-05"
	save "$proyecto/data/consultas/`file'.dta", replace
}
