* Macros auxiliares y objetos temporales
local id "01-02"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{1: N (en miles)}"
.table.cmds_fmt   = "{%15,1fc}"
.table.years      = "2010 2011 2012 2013 2014 2015 2016"
.table.months     = "1 2 3 4 5 6 7 8 9 10 11 12"
.table.subpops    = "{if _ocupado == 1} {if _desocupado == 1} {if _pea == 1}"
.table.subpops_lb = "{1: Ocupados} {2: Desocupados} {3: Fuerza de Trabajo}"
.table.by         = ""
.table.along      = ""
.table.margins    = ""
.table.margins_lb = ""
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_ocupado _desocupado _pea"

* Estimación
.table.create
.table.add_asterisks
replace bh = bh / 1000
save "$proyecto/data/consultas/`id'.dta", replace
