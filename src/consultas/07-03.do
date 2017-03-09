* Macros auxiliares y objetos temporales
local id "07-03"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter} {proportion _razon_inactividad}"
.table.cmds_lb    = "{1: N} {2: %}"
.table.cmds_fmt   = "{%15,0fc} {%15,1fc}"
.table.years      = "2015"
.table.months     = ""
.table.subpops    = "{if (_nini == 1)}"
.table.subpops_lb = "{1: NINI's}"
.table.by         = "_razon_inactividad"
.table.along      = "_mujer"
.table.margins    = "{_razon_inactividad}"
.table.margins_lb = "{Total}"
.table.src        = "casen"
.table.from       = "$datos"
.table.varlist0   = "_mujer _nini _razon_inactividad `var'"

* Estimación
.table.create
fillin _razon_inactividad _mujer cmd_lb
replace subpop_lb = 1         if (_fillin == 1)
replace cmd_fmt   = "%15,0fc" if (_fillin == 1)
replace cmd_type  = "total"   if (_fillin == 1)
replace año       = 2015      if (_fillin == 1)
replace bh        = 0         if (_fillin == 1)
replace n         = 0         if (_fillin == 1)
drop _fillin
.table.add_asterisks
save "$proyecto/data/consultas/`id'.dta", replace
