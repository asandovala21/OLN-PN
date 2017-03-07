** Genera las consultas 04-09, 05-09, 06-09, 07-09, 08-09.

* Loop principal
local i = 4
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{proportion _educ}"
	.table.cmds_lb    = "{1: %}"
	.table.cmds_fmt   = "{%15,1fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{1: Ocupados}"
	.table.by         = "_educ"
	.table.along      = "`var'"
	.table.margins    = "{_educ} {`var'}"
	.table.margins_lb = "{Total} {Total}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_educ _ocupado `var'"
	if inlist(`i', 4, 7) {
		.table.cmds     = "{total _counter}"
		.table.cmds_lb  = "{1: N}"
		.table.years    = "2016"
		.table.months   = "2 5 8 11"
		.table.src      = "ene"
	}

	* Estimación
	.table.create
	if inlist(`i', 4, 7) {
		.table.annualize
		.table.add_proportions, cmd_lb("2: %") cmd_fmt("%15,1fc")
		keep if (cmd_lb == 2)
	}
	.table.add_asterisks
	save "$proyecto/data/consultas/0`i'-09.dta", replace
	local ++i
}
