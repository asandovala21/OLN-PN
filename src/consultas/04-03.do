** Genera las consultas 04-03, 05-03, 06-03, 08-03.

* Loop principal
local i = 4
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{total _counter} {proportion _razon_inactividad}"
	.table.cmds_lb    = "{1: N} {2: %}"
	.table.cmds_fmt   = "{%15,0fc} {%15,1fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _inactivo == 1}"
	.table.subpops_lb = "{1: Inactivos}"
	.table.by         = "_razon_inactividad"
	.table.along      = "`var'"
	.table.margins    = "{_razon_inactividad}"
	.table.margins_lb = "{Total}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_inactivo _razon_inactividad `var'"
	if (`i' == 4) {
		.table.cmds     = "{total _counter}"
		.table.cmds_lb  = "{1: N}"
		.table.years    = "2016"
		.table.months   = "2 5 8 11"
		.table.src      = "ene"
	}

	* Estimación
	if (`i' != 7) {
		.table.create
		if (`i' == 4) .table.annualize
		if (`i' == 4) .table.add_proportions, cmd_lb("2: %") cmd_fmt("%15,1fc")
		fillin _razon_inactividad cmd_lb `var'
		replace subpop_lb = 1         if (_fillin == 1)
		replace cmd_fmt   = "%15,0fc" if (_fillin == 1)
		replace cmd_type  = "total"   if (_fillin == 1)
		replace año       = 2015      if (_fillin == 1)
		replace bh        = 0         if (_fillin == 1)
		replace n         = 0         if (_fillin == 1)
		drop _fillin
		.table.add_asterisks
		drop if (`var' == 1e5)
	}
	save "$proyecto/data/consultas/0`i'-03.dta", replace
	local ++i
}
