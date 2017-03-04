** Genera las consultas 04-01, 05-01, 06-01, 07-01, 08-01.

* Macros auxiliares y objetos temporales
tempfile df
local i = 4

* Loop principal
drop _all
save `df', replace emptyok
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Especificación
	.table = .ol_table.new
	.table.cmds =  ///
		"{ratio _desocupado/_pea}" +  ///
		"{ratio _ocupado/_pet}" +  ///
		"{ratio _pea/_pet}"
	.table.cmds_lb =  ///
		"{1: Tasa de desocupación}" +  ///
		"{2: Tasa de ocupación}" +  ///
		"{3: Tasa de participación}"
	.table.cmds_fmt   = "{%15,1fc} {%15,1fc} {%15,1fc}"
	.table.years      = "2009 2011 2013 2015"
	.table.months     = ""
	.table.subpops    = "{if _pet == 1}"
	.table.subpops_lb = "{1: PET}"
	.table.by         = ""
	.table.along      = "`var'"
	.table.margins    = ""
	.table.margins_lb = ""
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_desocupado _ocupado _pea _pet `var'"

	* Estimación
	.table.create
	.table.add_asterisks
	replace bh = 100 * bh
	save "$proyecto/data/consultas/0`i'-01.dta", replace
	local ++i
}
