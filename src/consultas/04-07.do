** Genera las consultas 04-07, 05-07, 06-07, 07-07, 08-07.

* Macros auxiliares y objetos temporales
tempfile df
local i = 4

* Loop principal
drop _all
save `df', replace emptyok
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{proportion _rama1_v1}"
	.table.cmds_lb    = "{1: %}"
	.table.cmds_fmt   = "{%15,1fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
	.table.subpops_lb = "{1: Ocupados}"
	.table.by         = "_rama1_v1"
	.table.along      = "`var'"
	.table.margins    = "{_rama1_v1} {`var'}"
	.table.margins_lb = "{Total} {Total}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_ocupado _rama1_v1 `var'"

	* Estimación
	.table.create
	.table.add_asterisks
	save "$proyecto/data/consultas/0`i'-07.dta", replace
	local ++i
}
