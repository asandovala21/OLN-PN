** Genera las consultas 04-01, 05-01, 06-01, 07-01, 08-01.

* Loop principal
local i = 4
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
	if inlist(`i', 4, 7) {
		.table.years    = "2010 2011 2012 2013 2014 2015 2016"
		.table.months   = "2 5 8 11"
		.table.src      = "ene"
	}

	* Estimación
	.table.create
	if inlist(`i', 4, 7) {
		.table.annualize
	}
	.table.add_asterisks
	replace bh = 100 * bh
	save "$proyecto/data/consultas/0`i'-01.dta", replace
	local ++i
}
