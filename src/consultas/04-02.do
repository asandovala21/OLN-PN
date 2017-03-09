** Genera las consultas 04-02, 05-02, 06-02, 08-02.

* Loop principal
local i = 3
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Filtro
	local ++i
	if (`i' == 7) continue

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
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _pet == 1}"
	.table.subpops_lb = "{1: PET}"
	.table.by         = ""
	.table.along      = "`var' _educ"
	.table.margins    = "{_educ}"
	.table.margins_lb = "{Total}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_desocupado _educ _ocupado _pea _pet `var'"
	if (`i' == 4) {
		.table.years    = "2016"
		.table.months   = "2 5 8 11"
		.table.src      = "ene"
	}

	* Estimaci+on
	.table.create
	if (`i' == 4) .table.annualize
	replace bh = 100 * bh
	.table.add_asterisks

	* Ajustes
	recode `var' (1 = -1)
	drop if (`var' == 1e5)
	local lb : label `var' 1
	label define `var' -1 "`lb'", modify
	save "$proyecto/data/consultas/0`i'-02.dta", replace
}
