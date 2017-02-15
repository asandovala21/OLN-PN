* Macros auxiliares
local id "03-20"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{N}"
.table.years      = "2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _conmutante_v1 == 1}"
.table.subpops_lb = "{Conmutantes}"
.table.by         = ""
.table.along      = "_rama1_v1"
.table.aggregate  = "{_rama1_v1}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_conmutante_v1 _rama1_v1"

* Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
