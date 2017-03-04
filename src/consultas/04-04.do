** Genera las consultas 04-04, 05-04, 06-04, 07-04, 08-04.

* Macros auxiliares y objetos temporales
tempfile df
local i = 4

* Loop principal
drop _all
save `df', replace emptyok
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{proportion _cise_v3}"
	.table.cmds_lb    = "{1: %}"
	.table.cmds_fmt   = "{%15,1fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{1: Ocupados}"
	.table.by         = "_cise_v3"
	.table.along      = "`var'"
	.table.margins    = "{_cise_v3} {`var'}"
	.table.margins_lb = "{Total} {Total}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_cise_v3 _ocupado `var'"

	* Estimación
	.table.create
	.table.add_asterisks
	save "$proyecto/data/consultas/0`i'-04.dta", replace
	local ++i
}
