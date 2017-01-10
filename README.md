OLN-PN
=======

Panorama Nacional.

Intrucciones de Uso
-------------------

1. Visite https://github.com/igutierrezm.
2. Clone los repositorios OLN-PN y OLN-Tools.
3. Abra ``main.do`` (ubicado dentro del repo OLN-ITD) y edite las siguientes
macros globales:
  * ``$proyecto``, el directorio en el cual clonó OLN-PN.
  * ``$OLNTools``, el directorio en el cual clonó OLN-Tools.
  * ``$datos``, el directorio principal de sus BBDD (CASEN, ENE, ESI, etc.).
  * ``$bsrweight``, el directorio principal de sus pesos de replicación.¹
4. Ejecute ``$proyecto/main.do``.

Importante
----------

OLN-ITD asume que las BBDD dentro de ``$datos`` se organizan como sigue:
```
$datos/
  CASEN/CASEN <año>.dta        // CASEN genérica
  ENE/ENE <año> <mes>.dta      // ENE genérica
  ESI/ESI <año> Personas.dta   // ESI genérica (Base Personas)
  PIB/
    PIB NSCO.dta     // PIB Nacional Sectorial Corriente  Original
    PIB NSEO.dta     // PIB Nacional Sectorial Encadenado Original
    PIB NSED.dta     // PIB Nacional Sectorial Encadenado Desestacionalizado
    PIB RSCO.dta     // PIB Regional Sectorial Corriente  Original
    PIB RSEO.dta     // PIB Regional Sectorial Encadenado Original
```
en donde:
- ``<año>`` representa a un año genérico en formato %4d (por ejemplo, 2015).
- ``<mes>`` representa a un mes genérico en formato %2d (por ejemplo, 01).


----------------
¹ Solo necesario si desea estimar varianzas usando bootstrap. 
