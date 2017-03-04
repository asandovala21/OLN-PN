* Macros auxiliares y objetos temporales
local id "01-01"

* Especificación
.table = .ol_table.new
.table.cmds =  ///
  "{ratio _desocupado / _pea}" +  ///
  "{ratio _ocupado / _pet}" +  ///
  "{ratio _pea / _pet}"
.table.cmds_lb =  ///
  "{1: Tasa de desocupación}" +  ///
  "{2: Tasa de ocupación}" +  ///
  "{3: Tasa de participación}"
.table.cmds_fmt   = "{%15,1fc} {%15,1fc} {%15,1fc}"
.table.years      = "2010 2011 2012 2013 2014 2015 2016"
.table.months     = "1 2 3 4 5 6 7 8 9 10 11 12"
.table.subpops    = "{if _pet == 1}"
.table.subpops_lb = "{1: pet}"
.table.by         = ""
.table.along      = ""
.table.margins    = ""
.table.margins_lb = ""
.table.src        = "ene"
.table.from       = "$datos"
.table.varlist0   = "_desocupado _ocupado _pea _pet"

* Estimación
.table.create
.table.add_asterisks
replace bh = 100 * bh
save "$proyecto/data/consultas/`id'.dta", replace
