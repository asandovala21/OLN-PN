* Macros auxiliares
local id "01-05"

* Especificación
.table = .ol_table.new
.table.cmds       = "{proportion _jparcial_inv}"
.table.cmds_lb    = "{%}"
.table.years      = "2010 2011 2012 2013 2014 2015 2016"
.table.months     = "1 2 3 4 5 6 7 8 9 10 11 12"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{Ocupados}"
.table.by         = "_jparcial_inv"
.table.along      = ""
.table.aggregate  = "{_jparcial_inv}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_jparcial_inv _ocupado"

* Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
