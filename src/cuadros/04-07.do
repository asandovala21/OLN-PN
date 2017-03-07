* Macros auxiliares y objetos temporales
local by4 "sexo"
local by5 "condición de discapacidad"
local by6 "pertenencia a pueblos indígenas"
local by7 "condición de joven"
local by8 "condición de inmigrante"
local i = 3

* Loop principal
foreach var in "_mujer" "_discapacitado" "_indigena" "_joven" "_extranjero" {
  local ++i
  * Especificación
  .table = .ol_table.new
  .table.rowvar = "_rama1_v1"
  .table.colvar = "`var'"
  .table.title  =  ///
    "`i'.7. Distribución de ocupados por `by`i'' según sector económico, 2015"

  * Exportación
  local id "0`i'-07"
  use "$proyecto/data/consultas/`id'.dta", clear
  .table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
}
