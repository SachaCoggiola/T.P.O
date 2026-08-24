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

{ #category : 'creation' }
Mascota class >> crearConNombre: unNombre conEspecie: unaEspecie conRaza: unaRaza conFechaNacimiento: unaFechaNac conPeso: unPeso conId: unId [
	|mascota|
		mascota := self new.
		mascota inicializarConNombre: unNombre conEspecie: unaEspecie conRaza: unaRaza conFechaNacimiento: unaFechaNac conPeso: unPeso conId: unId.
		^mascota.
]

{ #category : 'setters' }
Mascota >> agregarAplicacion: unaAplicacion [
	|cargado|
	cargado := true.
		(colAplicaciones anySatisfy: [ :cadaAplicacion | cadaAplicacion equals: unaAplicacion ]) 
			ifFalse: 
				[ 	colAplicaciones add: unaAplicacion .
					 self changed: #Aplicacion ] 
			ifTrue: 
				[ cargado := false ].
	^cargado

]

{ #category : 'comparing' }
Mascota >> equals: unaMascota [
	|idUnaMascota|
		idUnaMascota := unaMascota getId.
^(id = idUnaMascota).
]

{ #category : 'getters' }
Mascota >> getColAplicaciones [.
^colAplicaciones .
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
	colAplicaciones sortBlock: [ :aplicacion1 :aplicacion2 | aplicacion1 getFecha >= aplicacion2 getFecha ].

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
Mascota >> tieneVacunaVencida [
	|listaVigentes vencida|
	listaVigentes := OrderedCollection new.
	vencida := false.
	colAplicaciones do: [ :unaAplicacion |
		unaAplicacion estaVencida 
		ifFalse: [ 
			listaVigentes add: unaAplicacion
		]
		ifTrue: [ 
			(listaVigentes anySatisfy: [ :otraAplicacion | otraAplicacion tieneRefuerzo: unaAplicacion ]) ifFalse: [ vencida := true ].
		].
	].
^ vencida
]

{ #category : 'getters' }
Mascota >> toString [
^ ('Nombre: ', nombre,
      ' | Especie: ' , especie,
      ' | Raza: ' , raza)

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
