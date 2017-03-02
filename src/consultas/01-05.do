* Macros auxiliares y objetos temporales
local id "01-05"

* Especificación
.table = .ol_table.new
.table.cmds       = "{proportion _jparcial_inv}"
.table.cmds_lb    = "{1: %}"
.table.cmds_fmt   = "{%15,1fc}"
.table.years      = "2010 2011 2012 2013 2014 2015 2016"
.table.months     = "1 2 3 4 5 6 7 8 9 10 11 12"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{1: Ocupados}"
.table.by         = "_jparcial_inv"
.table.along      = ""
.table.margins    = ""
.table.margins_lb = ""
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_jparcial_inv _ocupado"

* Estimación
.table.create
.table.add_asterisks
keep if (_jparcial_inv == 1)
save "$proyecto/data/consultas/`id'.dta", replace
