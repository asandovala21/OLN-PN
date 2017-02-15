* Macros auxiliares
local id "03-06"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{N}"
.table.years      = "2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{Ocupados}"
.table.by         = ""
.table.along      = "_region_re_v1 _cise_v3"
.table.aggregate  = "{_region_re_v1} {_cise_v3} {_region_re_v1 _cise_v3}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_cise_v3 _ocupado _region_re_v1"

* Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
