* indicadores  : ingreso promedio de la ocupación principal
* subpoblación : ocupados que mantuvieron su empleo
* por          : gran grupo de ocupación (oficio1)
* según        : año (2010-2015)
* agregaciones : "oficio1"
* fuente       : ESI

* Especificación
.tabla = .ol_table.new
  * Abreviaciones
  * Estadísticas
  .tabla.cmds      = `""mean _yprincipal""'
  .tabla.masks     = `""ingreso promedio en la oc. principal (M$)""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = ""
  .tabla.subpop    = "if (_ocupado == 1) & (_mantuvo_empleo == 1)"
  .tabla.over      = "_oficio1"
  .tabla.aggregate = `""_oficio1""'
  * I-O
  .tabla.src       = "esi"
  .tabla.varlist0  = "_ocupado _mantuvo_empleo _oficio1 _yprincipal"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-17", replace
