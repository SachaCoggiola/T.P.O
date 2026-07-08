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
Aplicacion class >> crearConFecha: unaFecha conMascota: mascota conMedico: medico conVacuna: vacuna [
|unaAplicacion|
unaAplicacion := self new.
unaAplicacion inicializarConFecha: unaFecha conMascota: mascota conMedico: medico conVacuna: vacuna.
^unaAplicacion .
]

{ #category : 'getters' }
Aplicacion >> getFecha [
^fecha.
]

{ #category : 'getters' }
Aplicacion >> getMascota [
^unaMascota.
]

{ #category : 'getters' }
Aplicacion >> getMedico [
^unMedico.
]

{ #category : 'getters' }
Aplicacion >> getVacuna [
^unaVacuna.
]

{ #category : 'initialization' }
Aplicacion >> inicializarConFecha: unaFecha conMascota: mascota conMedico: medico conVacuna: vacuna [
	fecha := unaFecha .
	unaMascota := mascota .
	unMedico := medico.
	unaVacuna := vacuna.
]
