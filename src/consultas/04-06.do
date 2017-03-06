** Genera las consultas 04-06, 05-06, 06-06, 07-06, 08-06.

* Loop principal
local i = 4
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
	* Especificación
	.table = .ol_table.new
	.table.cmds       = "{mean _yprincipal} {mean _yprincipal_hr}"
	.table.cmds_lb    = "{1: Ingreso} {2: Ingreso por hora}"
	.table.cmds_fmt   = "{%15,0fc} {%15,0fc}"
	.table.years      = "2015"
	.table.months     = ""
	.table.subpops    = "{if inlist(_cise_v1, 2, 3)"
	.table.subpops_lb = "{1: Asalariados + Cuenta Propia}"
	.table.by         = ""
	.table.along      = "_cise_v1 _educ `var'"
	.table.margins    = "{_educ}"
	.table.margins_lb = "{Total}"
	.table.src        = "casen"
	.table.from       = "$datos"
	.table.varlist0   = "_cise_v1 _educ _yprincipal _yprincipal_hr `var'"

	* Estimación
	.table.create
	.table.add_asterisks
	save "$proyecto/data/consultas/0`i'-06.dta", replace
	local ++i
}
