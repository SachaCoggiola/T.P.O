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

{ #category : 'getters' }
Persona >> getApellido [
^apellido.
]

{ #category : 'getters' }
Persona >> getDomicilio [
^domicilio.
]

{ #category : 'getters' }
Persona >> getNombre [
^nombre.
]

{ #category : 'getters' }
Persona >> getNroDoc [
^nroDoc.
]

{ #category : 'initialization' }
Persona >> inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio [
	nroDoc := unNroDoc.
	nombre := unNombre.
	apellido := unApellido.
	domicilio := unDomicilio.
]

{ #category : 'setters' }
Persona >> setApellido: unApellido [
	apellido := unApellido.
]

{ #category : 'setters' }
Persona >> setDomicilio: unDomicilio [
	domicilio := unDomicilio.
]

{ #category : 'setters' }
Persona >> setNombre: unNombre [
	nombre := unNombre.
]
