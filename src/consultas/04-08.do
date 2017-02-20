* Genera las consultas 0x-08, x = 4, ..., 7
local i = 3
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_inmigrante" {
  * Filtro (de momento, aplazaré el analísis de la discapacidad)
	local ++i
	if (`i' == 5) continue

  * Especificación
  .table = .ol_table.new
	.table.cmds       = "{proportion _oficio1}"
	.table.cmds_lb    = "{%}"
  .table.years      = "2015"
  .table.months     = ""
	.table.subpops    = "{if _ocupado == 1}"
  .table.subpops_lb = "{Ocupados}"
  .table.by         = "_oficio1"
  .table.along      = "`var'"
	.table.aggregate  = "{`var'} {_oficio1} {`var' _oficio1}"
  .table.src        = "casen"
  .table.from       = "$datos"
  .table.varlist0   = "`var' _ocupado _oficio1"

  * Estimación
	.table.create
	local file "0`i'-08"
	save "$proyecto/data/consultas/`file'.dta", replace
}
