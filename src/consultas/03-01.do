* Macros auxiliares
local id "03-01"

* Especificación
.table = .ol_table.new
.table.cmds       = "."
.table.cmds_lb    = "."
.table.years      = "2016"
.table.months     = "2 5 8 11"
.table.subpops    = "{if _ocupado == 1}"
.table.subpops_lb = "{Ocupados}"
.table.by         = ""
.table.along      = "."
.table.aggregate  = ""
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_edad _esc _mujer _ocupado _superior_completa"

* Estimación - Panel N°1
.table.cmds    = "{mean _edad}"
.table.cmds_lb = "{Edad promedio}"
.table.along   = ""
.table.create
save "$proyecto/data/consultas/`id' [1].dta", replace

* Estimación - Panel N°2
.table.cmds    = "{mean _esc}"
.table.cmds_lb = "{Escolaridad promedio}"
.table.along   = ""
.table.create
save "$proyecto/data/consultas/`id' [2].dta", replace

* Estimación - Panel N°3
.table.cmds    = "{total _counter}"
.table.cmds_lb = "{N}"
.table.along   = "_superior_completa"
.table.create
save "$proyecto/data/consultas/`id' [3].dta", replace

* Estimación - Panel N°4
.table.cmds    = "{total _counter}"
.table.cmds_lb = "{N}"
.table.along   = "_mujer"
.table.create
save "$proyecto/data/consultas/`id' [4].dta", replace
