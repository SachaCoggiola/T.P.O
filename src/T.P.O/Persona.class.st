Class {
	#name : 'Persona',
	#superclass : 'Object',
	#instVars : [
		'nroDoc',
		'nombre',
		'apellido',
		'domicilio'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'initialization' }
Persona >> inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio [
	nroDoc := unNroDoc.
	nombre := unNombre.
	apellido := unApellido.
	domicilio := unDomicilio.
]
