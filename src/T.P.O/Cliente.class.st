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
Cliente class >> crearConNombre: unNombre conApellido: unApellido conNroDni: unNroDni conDomicilio: unDomicilio conEmail: unEmail conTelefono: unTel [
	|cliente|
		cliente := self new.
		cliente inicializarConNroDoc: unNroDni conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conTelefono: unTel conEmail: unEmail.
		^cliente.
]

{ #category : 'as yet unclassified' }
Cliente >> inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conTelefono: unTelefono conEmail: unEmail [
	self inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio.
	telContacto := unTelefono.
	email := unEmail.
	colMascotas := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
Cliente >> tieneMascota: unaMascota [
	|tieneMascota|
		tieneMascota := colMascotas anySatisfy: [:cadaMascota | cadaMascota equals: unaMascota ].
		^tieneMascota.
]
