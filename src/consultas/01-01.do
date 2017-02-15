* Macros auxiliares
local id "01-01"

* Especificación
.table = .ol_table.new
.table.cmds       = "{ratio _desocupado / _pea} {ratio _ocupado / _pet} {ratio _pea / _pet}"
.table.cmds_lb    = "{Tasa de desocupación} {Tasa de ocupación} {Tasa de participación}"
.table.years      = "2010 2011 2012 2013 2014 2015 2016"
.table.months     = "1 2 3 4 5 6 7 8 9 10 11 12"
.table.subpops    = "{if _pet == 1}"
.table.subpops_lb = "{pet}"
.table.by         = ""
.table.along      = ""
.table.aggregate  = ""
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_ocupado _desocupado _pea _pet"

* Estimación
.table.create
save "$proyecto/data/consultas/`id'.dta", replace
