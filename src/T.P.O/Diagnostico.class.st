Class {
	#name : 'Diagnostico',
	#superclass : 'Object',
	#instVars : [
		'fecha',
		'descripcion',
		'medico',
		'mascota',
		'colTratamientos'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
Diagnostico class >> crearConFechaDiagnostico: unaFecha conDescripcion: unaDescripcion conMedico: unMedico conMascota: unaMascota [
	|diagnostico|
		diagnostico := self new.
		diagnostico inicializarConFechaDiagnostico: unaFecha conDescripcion: unaDescripcion conMedico: unMedico conMascota: unaMascota.
		^diagnostico. 
]

{ #category : 'initialization' }
Diagnostico >> inicializarConFechaDiagnostico: unaFecha conDescripcion: unaDescripcion conMedico: unMedico conMascota: unaMascota [
	fecha := unaFecha.
	descripcion := unaDescripcion.
	medico := unMedico.
	mascota := unaMascota.
	colTratamientos := OrderedCollection new.
]

{ #category : 'propiosDelTipo' }
Diagnostico >> registrarTratamiento: unTratamiento [
	(unTratamiento esValido) ifTrue: [ colTratamientos add: unTratamiento ].
]
