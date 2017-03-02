* Macros auxiliares y objetos temporales
local i = 3  // eventualmente, el id

* Loop principal
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (temporal)
	local ++i
	if (`i' == 5) continue

	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{ratio _desocupado / _pea} {ratio _ocupado / _pet} {ratio _pea / _pet}"
	.table.cmds_lb    = "{1: Tasa de desocupación} {2: Tasa de ocupación} {3: Tasa de participación}"
	.table.cmds_fmt   = "{%15,1fc} {%15,1fc} {%15,1fc}"
	.table.years      = "2009 2011 2013 2015"
	.table.months     = ""
	.table.subpops    = "{if _pet == 1}"
	.table.subpops_lb = "{1: pet}"
	.table.by         = ""
	.table.along      = "`var'"
	.table.margins    = ""
	.table.margins_lb = ""
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_desocupado _ocupado _pea _pet `var'"

	local file "0`i'-01"
	replace bh = 100 * bh
	* Estimación
	.table.create
	.table.annualize
	.table.add_proportions, cmd_lb("2: %") cmd_fmt("%15,1fc")
	.table.add_asterisks
	keep if (cmd_lb == 2)
	save "$proyecto/data/consultas/`id'.dta", replace
}
