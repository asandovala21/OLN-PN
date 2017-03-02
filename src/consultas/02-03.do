* Macros auxiliares y objetos temporales
local id "02-03"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{1: N}"
.table.cmds_fmt   = "{%15,0fc}"
.table.years      = "2010 2011 2012 2013 2014 2015"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{1: Ocupados}"
.table.by         = "_tamaño_empresa"
.table.along      = ""
.table.margins    = "{_tamaño_empresa}"
.table.margins_lb = "{Total}"
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_ocupado _tamaño_empresa"

* Estimación
.table.create
.table.annualize
.table.add_proportions, cmd_lb("2: %") cmd_fmt("%15,1fc")
.table.add_asterisks
keep if (cmd_lb == 2)
save "$proyecto/data/consultas/`id'.dta", replace
