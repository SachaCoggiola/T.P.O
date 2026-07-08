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
^(id = idUnaMascota).
]

{ #category : 'getters' }
Mascota >> getEspecie [
^especie.
]

{ #category : 'getters' }
Mascota >> getFechaNacimiento [
^fechaNacimiento.
]

{ #category : 'getters' }
Mascota >> getId [
^id.
]

{ #category : 'getters' }
Mascota >> getNombre [
^nombre.
]

{ #category : 'getters' }
Mascota >> getPeso [
^peso.
]

{ #category : 'getters' }
Mascota >> getRaza [
^raza.
]

{ #category : 'initialization' }
Mascota >> inicializarConNombre: unNombre conEspecie: unaEspecie conRaza: unaRaza conFechaNacimiento: unaFechaNac conPeso: unPeso conId: unId [
	nombre := unNombre.
	especie := unaEspecie.
	raza := unaRaza.
	fechaNacimiento := unaFechaNac.
	peso := unPeso.
	id := unId. 
]

{ #category : 'setters' }
Mascota >> setNombre: unNombre [
	nombre := unNombre.
]

{ #category : 'setters' }
Mascota >> setPeso: unPeso [
	peso := unPeso.
]
