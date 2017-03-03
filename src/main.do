* PN - Panorama Nacional (script principal)

* Housekeeping
set scrollbufsize 2000000
set matsize 10000
set more off
clear all
cls

* Macros globales
global datos    "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"
global GitHub   "C:/Users/Pedro/Documents/GitHub"
global OLNTools "$GitHub/OLN-Tools"
global proyecto "$GitHub/OLN-PN"

* Paquetes externos
foreach pkg in "" "_casen" "_ene" "_esi" "_pib" "_sii" {
	net install ol_tools`pkg', all force from("$OLNTools/src")
}

* Cuadros
foreach folder in "cuadros" {
	local files : dir "$proyecto/src/`folder'" files "*.do", respectcase
	foreach file of local files {
		if !inlist("`file'", "03-07.do", "03-12.do", "03-17.do") continue
		do "$proyecto/src/`folder'/`file'"
	}
}
beep
