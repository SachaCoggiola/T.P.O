Class {
	#name : 'Aplicacion',
	#superclass : 'Object',
	#instVars : [
		'fecha',
		'unaMascota',
		'unMedico',
		'unaVacuna'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
Aplicacion class >> crearConFecha: unaFecha ConMascota: mascota ConMedico: medico ConVacuna: vacuna [
|unaAplicacion|
unaAplicacion := self new.
unaAplicacion inicializarConFecha: unaFecha ConMascota: mascota ConMedico: medico ConVacuna: vacuna.
^unaAplicacion .
]

{ #category : 'initialization' }
Aplicacion >> inicializarConFecha: unaFecha ConMascota: mascota ConMedico: medico ConVacuna: vacuna [
fecha := unaFecha .
unaMascota := mascota .
unMedico := medico.
unaVacuna := vacuna.
]
