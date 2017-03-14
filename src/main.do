* PN - Panorama Nacional (script principal)

* Directorios (editar) 
global OLNTools "C:/Users/observatorio02/Documents/GitHub/OLN-Tools"
global proyecto "C:/Users/observatorio02/Documents/GitHub/OLN-PN"
global datos    "C:/Users/observatorio02/Documents/BBDD/Stata"

* Solicitudes (editar) 
global cuadros "02-0[4-8]"

* Preámbulo
set more off
foreach pkg in "" "_casen" "_ene" "_esi" "_pib" "_sii" {
	net install ol_tools`pkg', all force from("$OLNTools/src")  
}
set matsize 10000
clear all
cls

* Cuerpo
foreach folder in "consultas" "cuadros" {
	noisily : display as text "`folder'/"
	local files : dir "$proyecto/src/`folder'" files "*.do", respectcase
	foreach file of local files {
		if regexm("`file'", "$cuadros.do") {
			run "$proyecto/src/`folder'/`file'"
			noisily : display as text _skip(4) "`file' completado"
		}
	}
}
beep
