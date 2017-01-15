* indicadores  : fracción de mujeres, edad promedio y escolaridad promedio
* subpoblación : ocupados
* años         : 2010-2015
* meses        : 2 5 8 11
* por          :
* según        :
* agregaciones : 
* fuente       : ENE

* Especificación
.tabla = .ol_table.new
  * Estadísticas
  .tabla.cmds      = `""mean _mujer" "mean _edad" "mean _esc""'
  .tabla.masks     = `""fracción mujeres" "edad prom." "escolaridad prom.""'
  * Dominios
  .tabla.years     = "2015"
  .tabla.months    = "2 5 8 11"
  .tabla.subpop    = "if _ocupado == 1"
  .tabla.over      = ""
  .tabla.aggregate = ""
  * I-O
  .tabla.src       = "ene"
  .tabla.varlist0  = "_edad _esc _mujer _ocupado"
* Estimación
.tabla.create
save "$proyecto/data/tabla 03-01", replace
