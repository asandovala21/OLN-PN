*** PN - Panorama Nacional (script principal)

*===============================================================================
* Prólogo
*===============================================================================

* Housekeeping
set more off
clear all
cls

* Macros globales
global datos    "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"
global proyecto "C:/Users/Pedro/Documents/GitHub/OLN-PN"

* Paquetes externos
local OLNTools "C:/Users/Pedro/Documents/GitHub/OLN-Tools/src"
net install ol_tools_casen, all force from("`OLNTools'")
net install ol_tools_ene,   all force from("`OLNTools'")
net install ol_tools_esi,   all force from("`OLNTools'")
net install ol_tools,       all force from("`OLNTools'")
* También puede descargar e instalar los paquetes simultáneamente fijando
* local OLNTools net from "https://rawgit.com/igutierrezm/OLNTools/master/src"

*===============================================================================
* Cuerpo
*===============================================================================

* Tablas (dta)
local files : dir "$proyecto/scripts/tablas" files "tabla 11-08.do"
foreach file of local files {
	*do "$proyecto/scripts/tablas/`file'"
}

* Tablas (xlsx)
local files : dir "$proyecto/scripts/tablas" files "tabla 11-08.do"
foreach file of local files {
	*do "$proyecto/scripts/tablas/`file'"
}
beep
