* Macros auxiliares
local id "03-02"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{N}"
.table.years      = "2010 2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1} {if _desocupado == 1}"
.table.subpops_lb = "{Ocupados} {Desocupados}"
.table.by         = ""
.table.along      = "_tramo_edad_v1"
.table.aggregate  = "{_tramo_edad_v1}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_desocupado _ocupado _tramo_edad_v1"

* Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
