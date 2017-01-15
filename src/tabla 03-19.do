* indicadores  : escolaridad promedio (años)
* subpoblación : ocupados conmutantes
* años         : 2015
* meses        : 2 5 8 11
* por          : región de residencia (region)
* según        : año (2010-2015), mes (2 5 8 11)
* agregaciones : "region"
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  * Estadísticas
  .tabla.cmds      = `""mean _esc""'
  .tabla.masks     = `""escolaridad promedio (años)""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if (_ocupado == 1) & (_conmutante_v1 == 1)"
  .tabla.over      = "_region_re_v1"
  .tabla.aggregate = "_region_re_v1"
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_conmutante_v1 _esc _ocupado _region_re_v1"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-19", replace
