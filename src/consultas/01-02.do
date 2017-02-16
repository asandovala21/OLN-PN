* Macros auxiliares
local id "01-02"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{N}"
.table.years      = "2010 2011 2012 2013 2014 2015 2016"
.table.months     = "1 2 3 4 5 6 7 8 9 10 11 12"
.table.subpops    = "{if _ocupado == 1} {if _desocupado == 1} {if _pea == 1}"
.table.subpops_lb = "{Ocupados (en miles)} {Desocupados (en miles)} {Fuerza de Trabajo (en miles)}"
.table.by         = ""
.table.along      = ""
.table.aggregate  = ""
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_ocupado _desocupado _pea"

* Estimación
.table.create
replace bh = bh / 1000
replace cmd_type = "mean"
save "$proyecto/data/consultas/`id'.dta", replace
