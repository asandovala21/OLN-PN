* PN - Panorama Nacional (script principal)

* Housekeeping
set scrollbufsize 2000000
set matsize 10000
set more off
clear all
cls

* Macros globales
global datos    "C:/Users/observatorio02/Documents/BBDD/Stata"
global GitHub   "C:/Users/observatorio02/Documents/GitHub"
global OLNTools "$GitHub/OLN-Tools"
global proyecto "$GitHub/OLN-PN"

* Paquetes externos
foreach pkg in "" "_casen" "_ene" "_esi" "_pib" "_sii" {
	net install ol_tools`pkg', all force from("$OLNTools/src")
}

* Cuadros
foreach folder in "consultas" {
	local files : dir "$proyecto/src/`folder'" files "02-*.do", respectcase
	foreach file of local files {
		if !inlist("`file'", "02-01.do") continue
		do "$proyecto/src/`folder'/`file'"
	}
}
beep
