* Macros auxiliares y objetos temporales
local id "01-03"

* Especificación
.table = .ol_table.new
.table.cmds       = "{total _counter}"
.table.cmds_lb    = "{1: Variación (%) 12 meses}"
.table.cmds_fmt   = "{%15,1fc}"
.table.years      = "2010 2011 2012 2013 2014 2015 2016"
.table.months     = "1 2 3 4 5 6 7 8 9 10 11 12"
.table.subpops    = "{if _ocupado == 1} {if _pea == 1}"
.table.subpops_lb = "{1: Ocupados (%)} {2: Fuerza de Trabajo (%)}"
.table.by         = ""
.table.along      = ""
.table.margins    = ""
.table.margins_lb = ""
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_ocupado _pea"

* Estimación
.table.create
.table.add_asterisks
sort subpop_lb año mes
by subpop_lb : generate delta = 100 * (bh[_n] - bh[_n - 12]) / bh[_n - 12]

* Ajustes finales
replace bh = delta
keep if (bh != .)
drop delta

* Guardado
save "$proyecto/data/consultas/`id'.dta", replace
