Class {
	#name : 'Mascota',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'especie',
		'raza',
		'fechaNacimiento',
		'peso',
		'id',
		'colAplicaciones'
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
	colAplicaciones := SortedCollection new.
]

{ #category : 'setters' }
Mascota >> setNombre: unNombre [
	nombre := unNombre.
]

{ #category : 'setters' }
Mascota >> setPeso: unPeso [
	peso := unPeso.
]

{ #category : 'propiosDelTipo' }
Mascota >> ultimaAplicacionDe: unaVacuna [
|ultimaAplicacion listaAplicacionesVacuna|

ultimaAplicacion := nil.
listaAplicacionesVacuna := OrderedCollection new.
listaAplicacionesVacuna := colAplicaciones select: [
	 :cadaAplicacion | cadaAplicacion tieneVacuna: unaVacuna ].

(listaAplicacionesVacuna isEmpty) ifFalse: [ 
	  listaAplicacionesVacuna asSortedCollection: [ :a :b | a getFecha <= b getFecha ].
	  ultimaAplicacion := listaAplicacionesVacuna at: 1.
	 ].

^ultimaAplicacion .
]
