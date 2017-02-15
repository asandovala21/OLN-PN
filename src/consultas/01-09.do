* Macros auxiliares
local id "01-09"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{N}"
.table.years      = "2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{_ocupado}"
.table.subpops_lb = "{Ocupados}"
.table.by         = ""
.table.along      = "_region_tr_v1 _rama1_v1"
.table.aggregate  = "{_region_tr_v1} {_rama1_v1} {_region_tr_v1 _rama1_v1}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_ocupado _rama1_v1 _region_tr_v1"

* Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
