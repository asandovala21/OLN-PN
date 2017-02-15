* Macros auxiliares
local id "03-04"

* Especificación
.table = .ol_table.new
.table.cmds       = "{mean _esc}"
.table.cmds_lb    = "{años promedio de escolaridad}"
.table.years      = "2010 2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{Ocupados}"
.table.by         = ""
.table.along      = "_region_re_v1"
.table.aggregate  = "{_region_re_v1}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_esc _ocupado _region_re_v1"

* Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
