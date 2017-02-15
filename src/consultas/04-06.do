* Macros auxiliares
local id "04-06"
local varlist "_mujer _discapacitado _indigena _joven _inmigrante"

* Loop principal
local i = 0
foreach var in `varlist' {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 2) continue

	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{mean _yprincipal} {mean _yprincipal_hr}"
	.table.cmds_lb    = "{Ingresos} {Ingresos por hora}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{_ocupado}"
	.table.subpops_lb = "{Ocupados}"
	.table.by         = ""
	.table.along      = "`var' _asalariado _educ"
	.table.aggregate  = "{_asalariado} {_educ} {_asalariado _educ}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_asalariado _educ `var' _ocupado _yprincipal _yprincipal_hr"

  * Estimación
	.table.create
	save "$proyecto/data/consultas/`id' [`i'].dta", replace
}
