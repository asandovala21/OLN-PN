* Macros auxiliares
local id "01-04"

* Especificación
.table = .ol_table.new
.table.cmds       = "{proportion _cise_v2}"
.table.cmds_lb    = "{%}"
.table.years      = "2010 2011 2012 2013 2014 2015 2016"
.table.months     = "1 2 3 4 5 6 7 8 9 10 11 12"
.table.subpops    = "{_ocupado}"
.table.subpops_lb = "{Ocupados}"
.table.by         = "_cise_v2"
.table.along      = ""
.table.aggregate  = "{_cise_v2}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_cise_v2 _ocupado"

* Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
