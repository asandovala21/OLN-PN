* indicadores  : promedio de YOPR
* subpoblación : ocupados que mantuvieron su empleo
* años         : 2010-2015
* meses        : 2 5 8 11
* por          : TEM [2] (excluyendo TCCU [3])
* según        : CISE
* agregaciones : "TEM", "CISE", "TEM, CISE"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  local cise "_cise_v1"
  local me   "_mantuvo_empleo"
  local tem  "_tamaño_empresa"
  local yopr "_yprincipal"
  * Estadísticas
  .tabla.cmds      = `""mean `yopr'""'
  .tabla.masks     = `""promedio YOPR (M$)""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = ""
  .tabla.subpop    = "if (_ocupado == 1) & (`tem' != 0) & (`me' == 1)"
  .tabla.over      = " `cise' `tem'"
  .tabla.aggregate = `""`tem'" "`cise'" "`tem' `cise'""'
  * I-O
  .tabla.src       = "esi"
  .tabla.varlist0  = "`cise' `me' _ocupado `tem' `yopr'"
* Estimación
.tabla.create
save "$proyecto/data/tabla 02-08", replace

* Notas al pie
* 1. Nivel educacional
* 2. Tamaño de empresa (de acuerdo al número de trabajadores)
* 3. Trabajadores por Cuenta Propia Unipersonales
