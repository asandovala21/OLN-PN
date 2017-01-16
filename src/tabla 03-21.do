* indicadores  : número y % de conmutantes
* subpoblación : ocupados
* años         : 2010 2015
* meses        :
* por          : gran grupo de ocupación (oficio1)
* según        :
* agregaciones : "oficio1"
* fuente       : ENE

* Especificación
.table = .ol_table.new
  * Estadísticas
  .table.cmds      = `""total _counter" "proportion _conmutante_v1""'
  .table.masks     = `""n" "%""'
  * Dominios
  .table.years     = "2010 2015"
  .table.months    = "2 5 8 11"
  .table.subpop    = "if (_ocupado == 1)"
  .table.rowvar    = "_conmutante_v1"
  .table.colvar    = "_oficio1"
  .table.aggregate = "_oficio1"
  * I-O
  .table.src       = "ene"
  .table.varlist0  = "_conmutante_v1 _ocupado _oficio1"
  cls

* Estimación
.table.create
.table.annualize
save "$proyecto/data/tabla 03-21", replace

* Exportación
.table.export_excel bh,  ///
  file("tabla 03-21") rowvar("_oficio1") colvar("año")
