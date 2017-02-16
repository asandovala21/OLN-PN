* PN - Panorama Nacional (script principal)

* Housekeeping
set scrollbufsize 2000000
set more off
clear all
cls

* Macros globales
global proyecto "C:/Users/Pedro/Documents/GitHub/OLN-PN"
global datos    "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"
global pkg      "C:/Users/Pedro/Documents/GitHub/OLN-Tools"

* Paquetes externos
foreach pkg in "" "_casen" "_ene" "_esi" "_pib" "_sii" {
	net install ol_tools`pkg', all force from("$pkg/src")
}

* Consultas y cuadros
local folder "cuadros"
local files : dir "$proyecto/src/`folder'" files "02-08.do"
foreach file of local files {
	noisily : do "$proyecto/src/`folder'/`file'"
}
beep
