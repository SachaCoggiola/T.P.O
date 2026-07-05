Class {
	#name : 'Mascota',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'especie',
		'raza',
		'fechaNacimiento',
		'peso',
		'id'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
Mascota class >> crearConNombre: unNombre conEspecie: unaEspecie conRaza: unaRaza conFechaNacimiento: unaFechaNac conPeso: unPeso conId: unId [
	|mascota|
		mascota := self new.
		mascota inicializarConNombre: unNombre conEspecie: unaEspecie conRaza: unaRaza conFechaNacimiento: unaFechaNac conPeso: unPeso conId: unId.
		^mascota.
]

{ #category : 'comparing' }
Mascota >> equals: unaMascota [
	|idUnaMascota|
		idUnaMascota := unaMascota getId.
		^id = idUnaMascota.
]

{ #category : 'as yet unclassified' }
Mascota >> getEspecie [
	^especie.
]

{ #category : 'as yet unclassified' }
Mascota >> getFechaNacimiento [
	^fechaNacimiento.
]

{ #category : 'as yet unclassified' }
Mascota >> getId [
	^id.
]

{ #category : 'as yet unclassified' }
Mascota >> getNombre [
	^nombre.
]

{ #category : 'as yet unclassified' }
Mascota >> getPeso [
	^peso.
]

{ #category : 'as yet unclassified' }
Mascota >> getRaza [
	^raza.
]

{ #category : 'as yet unclassified' }
Mascota >> inicializarConNombre: unNombre conEspecie: unaEspecie conRaza: unaRaza conFechaNacimiento: unaFechaNac conPeso: unPeso conId: unId [
	nombre := unNombre.
	especie := unaEspecie.
	raza := unaRaza.
	fechaNacimiento := unaFechaNac.
	peso := unPeso.
	id := unId. 
]

{ #category : 'initialization' }
Mascota >> setEspecie: unaEspecie [
	especie := unaEspecie.
]

{ #category : 'initialization' }
Mascota >> setFechaNacimiento: unaFechaNacimiento [
	fechaNacimiento := unaFechaNacimiento.
]

{ #category : 'initialization' }
Mascota >> setNombre: unNombre [
	nombre := unNombre.
]

{ #category : 'initialization' }
Mascota >> setPeso: unPeso [
	peso := unPeso.
]

{ #category : 'initialization' }
Mascota >> setRaza: unaRaza [
	raza := unaRaza.
]
