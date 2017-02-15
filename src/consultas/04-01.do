* Macros auxiliares
local id "04-01"

* Loop principal
local i = 0
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 2) continue

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
	save "$proyecto/data/consultas/`id' [`i'].dta", replace
}
