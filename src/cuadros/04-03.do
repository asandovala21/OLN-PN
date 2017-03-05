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
  if (`i' == 7) continue
  * Especificación
  .table = .ol_table.new
  .table.rowvar = "_razon_inactividad"
  .table.colvar = "`var' cmd_lb"
  .table.title  =  ///
    "`i'.3. Razones de inactividad según `by`i'', 2015"

  * Exportación
  local id "0`i'-03"
  use "$proyecto/data/consultas/`id'.dta", clear
  .table.export_excel bh, file("$proyecto/data/cuadros/bh.xlsx") sheet("`id'")
}
