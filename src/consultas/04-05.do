** Genera las consultas 04-05, 05-05, 06-05, 07-05, 08-05.

* Loop principal
local i = 4
local me = "_mantuvo_empleo"
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{mean _yprincipal}"
	.table.cmds_lb    = "{1: $}"
	.table.cmds_fmt   = "{%15,0fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{1: Ocupados}"
	.table.by         = ""
	.table.along      = "`var' _educ"
	.table.margins    = "{`var'} {_educ}"
	.table.margins_lb = "{Total} {Total}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_educ _ocupado _yprincipal `var'"
	if inlist(`i', 4, 7) {
		.table.src        = "esi"
		.table.subpops    = "{if `me' == 1}"
		.table.subpops_lb = "{2: Ocupados que mantuvieron su empleo}"
		.table.varlist0   = "_educ `me' _yprincipal `var'"
	}

	* Estimación
	.table.create
	.table.add_asterisks
	save "$proyecto/data/consultas/0`i'-05.dta", replace
	local ++i
}
