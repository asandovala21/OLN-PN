** Genera las consultas 04-04, 05-04, 06-04, 07-04, 08-04.

* Loop principal
local i = 4
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{proportion _cise_v3}"
	.table.cmds_lb    = "{1: %}"
	.table.cmds_fmt   = "{%15,1fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{1: Ocupados}"
	.table.by         = "_cise_v3"
	.table.along      = "`var'"
	.table.margins    = "{_cise_v3} {`var'}"
	.table.margins_lb = "{Total} {Total}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_cise_v3 _ocupado `var'"
	if inlist(`i', 4, 7) {
		.table.cmds       = "{total _counter}"
		.table.cmds_lb    = "{1: N}"
		.table.years      = "2010 2011 2012 2013 2014 2015 2016"
		.table.months     = "2 5 8 11"
		.table.src        = "ene"
	}

	* Estimación
	.table.create
	if inlist(`i', 4, 7) {
		.table.annualize
		.table.add_proportions, cmd_lb("2: %") cmd_fmt("%15,1fc")
		keep if (cmd_lb == 2)
	}
	.table.add_asterisks
	save "$proyecto/data/consultas/0`i'-04.dta", replace
	local ++i
}
