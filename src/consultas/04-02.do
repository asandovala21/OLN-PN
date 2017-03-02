* Genera las consultas 0x-02, x = 4, ..., 7
local i = 3
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 5) continue

	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{ratio _desocupado / _pea} {ratio _ocupado / _pet} {ratio _pea / _pet}"
	.table.cmds_lb    = "{Tasa de desocupación} {Tasa de ocupación} {Tasa de participación}"
	.table.cmds_fmt   = "{%15,1fc} {%15,1fc} {%15,1fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _pet == 1}"
	.table.subpops_lb = "{pet}"
	.table.by         = ""
	.table.along      = "`var' _educ"
	.table.margins    = "{_rama1_v1}"
	.table.margins_lb = "{Nacional}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_desocupado _educ `var' _ocupado _pea _pet"

  * Estimación
	local file "0`i'-02"
	replace bh = 100 * bh
	* Estimación
	.table.create
	.table.annualize
	.table.add_proportions, cmd_lb("2: %") cmd_fmt("%15,1fc")
	.table.add_asterisks
	keep if (cmd_lb == 2)
	save "$proyecto/data/consultas/`id'.dta", replace

}
