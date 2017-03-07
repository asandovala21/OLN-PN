** Genera las consultas 04-08, 05-08, 06-08, 07-08, 08-08.

* Loop principal
local i = 4
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{proportion _oficio1}"
	.table.cmds_lb    = "{1: %}"
	.table.cmds_fmt   = "{%15,1fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{1: Ocupados}"
	.table.by         = "_oficio1"
	.table.along      = "`var'"
	.table.margins    = "{_oficio1} {`var'}"
	.table.margins_lb = "{Total} {Total}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_ocupado _oficio1 `var'"
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
	save "$proyecto/data/consultas/0`i'-08.dta", replace
	local ++i
}
