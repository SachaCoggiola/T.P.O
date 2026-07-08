Class {
	#name : 'Cliente',
	#superclass : 'Persona',
	#instVars : [
		'telContacto',
		'email',
		'colMascotas'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
Cliente class >> crearConNombre: unNombre conApellido: unApellido conNroDni: unNroDni conDomicilio: unDomicilio conEmail: unEmail conTelefono: unTel conMascota: unaMascota [
	|cliente|
		cliente := self new.
		cliente inicializarConNroDoc: unNroDni conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conTelefono: unTel conEmail: unEmail conMascota: unaMascota.
		^cliente.
]

{ #category : 'propiosDelTipo' }
Cliente >> agregarMascota: unaMascota [
	colMascotas add: unaMascota.
]

{ #category : 'getters' }
Cliente >> getEmail [
^email.
]

{ #category : 'getters' }
Cliente >> getTelContacto [
^telContacto.
]

{ #category : 'initialization' }
Cliente >> inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conTelefono: unTelefono conEmail: unEmail conMascota: unaMascota [
	self inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio.
	telContacto := unTelefono.
	email := unEmail.
	colMascotas := OrderedCollection new.
	colMascotas add: unaMascota.
]

{ #category : 'setters' }
Cliente >> setEmail: unEmail [
	email := unEmail.
]

{ #category : 'setters' }
Cliente >> setTelContacto: telefono [
	telContacto := telefono.
]

{ #category : 'propiosDelTipo' }
Cliente >> tieneMascota: unaMascota [
	|tieneMascota|
		tieneMascota := colMascotas anySatisfy: [:cadaMascota | cadaMascota equals: unaMascota ].
^tieneMascota.
]
