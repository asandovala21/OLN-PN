* Genera las consultas 0x-01, x = 4, ..., 7
local i = 3
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 5) continue

	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{ratio _desocupado / _pea} {ratio _ocupado / _pet} {ratio _pea / _pet}"
	.table.cmds_lb    = "{Tasa de desocupación} {Tasa de ocupación} {Tasa de participación}"
	.table.years      = "2009 2011 2013 2015"
	.table.months     = ""
	.table.subpops    = "{if _pet == 1}"
	.table.subpops_lb = "{pet}"
	.table.by         = ""
	.table.along      = "`var'"
	.table.aggregate  = ""
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0 = "_desocupado `var' _ocupado _pea _pet"

	* Estimación
	.table.create
	local file "0`i'-01"
	replace bh = 100 * bh
	save "$proyecto/data/consultas/`file'.dta", replace
}
