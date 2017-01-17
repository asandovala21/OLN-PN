* indicadores  : número y distribución de ocupados y empresas
* subpoblación :
* años         : 2014
* meses        :
* por          : TEM¹ (excluyendo TCCU²)
* según        :
* agregaciones : "TEM"
* fuente       : ENE/SII

* Preparativos
drop _all
tempfile df1 df2
save `df1', emptyok
save `df2', emptyok

*===============================================================================
* Panel 1. Ocupados
*===============================================================================

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""total _counter" "proportion _tamaño_empresa""'
  .table.masks     = `""n" "%""'
  * Dominios
  .table.years     = "2014"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if (_ocupado == 1)"
  .table.by        = "_tamaño_empresa"
  .table.along     = ""
  .table.aggregate = "_tamaño_empresa"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_ocupado _tamaño_empresa"

* Estimación
.table.create
.table.annualize

* Guardado
generate base = 1
save "`df1'", replace

*===============================================================================
* Panel 2. Empresas
*===============================================================================

* Número
use sector tramo_ntrab using "$datos/SII/SII - Base empresas 2014", clear
collapse (count) bh = sector, by(tramo_ntrab)
rename tramo_ntrab _tamaño_empresa
generate cmdtype = "total"
generate mask    = 1
append using "`df2'", nolabel
save "`df2'", replace

* Distribución
replace cmdtype = "proportion"
replace mask    = 2
egen bh_sum = total(bh)
replace bh = 100 * bh / bh_sum
append using "`df2'", nolabel
save "`df2'", replace

* Agregación
replace _tamaño_empresa = 1e6
collapse (sum) bh, by(_tamaño_empresa cmdtype mask)
append using "`df2'", nolabel

* Ajustes finales
drop bh_sum
generate base = 2
generate año  = 2014
save "`df2'", replace

*===============================================================================
* Tabla completa
*===============================================================================

* Creación
use "`df1'", clear
append using "`df2'"

* Ajustes finales
order base año _tamaño_empresa mask bh
gsort base año _tamaño_empresa mask
label define base 1 "Ocupados" 2 "Empresas", modify
label values base base

* Guardado
save "$proyecto/data/tabla 02-02", replace

* Exportación
.table.rowvar = "_tamaño_empresa"
.table.colvar = "base mask"
.table.export_excel bh, file("tabla 02-02")
.table.export_excel cv, file("tabla 02-02")

* Notas al pie
* ¹ Tamaño de empresa (de acuerdo al número de trabajadores)
* ² Trabajadores por Cuenta Propia Unipersonales
