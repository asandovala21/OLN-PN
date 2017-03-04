** Genera las consultas 04-09, 05-09, 06-09, 07-09, 08-09.

* Macros auxiliares y objetos temporales
tempfile df
local i = 4

* Loop principal
drop _all
save `df', replace emptyok
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{proportion _educ}"
	.table.cmds_lb    = "{1: %}"
	.table.cmds_fmt   = "{%15,1fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{1: Ocupados}"
	.table.by         = "_educ"
	.table.along      = "`var'"
	.table.margins    = "{_educ} {`var'}"
	.table.margins_lb = "{Total} {Total}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_educ _ocupado `var'"

	* Estimación
	.table.create
	.table.add_asterisks
	save "$proyecto/data/consultas/0`i'-09.dta", replace
	local ++i
}
