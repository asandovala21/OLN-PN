* Genera las consultas 0x-06, x = 4, ..., 7
local i = 3
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 5) continue

	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{mean _yprincipal} {mean _yprincipal_hr}"
	.table.cmds_lb    = "{Ingresos (M$)} {Ingresos por hora (M$/hr)}"
	.table.cmds_fmt   = "{%15,1fc} {%15,1fc} {%15,1fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{Ocupados}"
	.table.by         = ""
	.table.along      = "`var' _asalariado _educ"
	.table.margins    = "{_rama1_v1}"
	.table.margins_lb = "{Nacional}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_asalariado _educ `var' _ocupado _yprincipal _yprincipal_hr"

	local file "0`i'-06"
	* Estimación
	.table.create
	.table.annualize
	.table.add_proportions, cmd_lb("2: %") cmd_fmt("%15,1fc")
	.table.add_asterisks
	keep if (cmd_lb == 2)
	save "$proyecto/data/consultas/`id'.dta", replace

}
