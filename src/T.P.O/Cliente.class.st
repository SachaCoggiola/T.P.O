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

{ #category : 'constructor' }
Cliente class >> crearConNombre: unNombre conApellido: unApellido conNroDni: unNroDni conDomicilio: unDomicilio conEmail: unEmail conTelefono: unTel [ 
	|cliente|
		cliente := self new.
		cliente inicializarConNroDoc: unNroDni conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conTelefono: unTel conEmail: unEmail.
		^cliente.
]

{ #category : 'propiosDelTipo' }
Cliente >> agregarMascota: unaMascota [
	|cargado|
	cargado := true.
		(colMascotas anySatisfy: [ :cadaMascota | cadaMascota equals: unaMascota ]) 
			ifFalse: 
				[ 	colMascotas add: unaMascota ] 
			ifTrue: 
				[ cargado := false ].
	^cargado 
]

{ #category : 'propiosDelTipo' }
Cliente >> buscarMascotaConId: unId [
	|mascota|
	mascota := colMascotas detect: [ :cadaMascota | cadaMascota getId = unId ] ifNone: [ nil ].
	^mascota
	
]

{ #category : 'propiosDelTipo' }
Cliente >> cantMascotas [ 
^(colMascotas size)
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
Cliente >> inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conTelefono: unTelefono conEmail: unEmail [
	self inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio.
	telContacto := unTelefono.
	email := unEmail.
	colMascotas := OrderedCollection new.
]

{ #category : 'propiosDelTipo' }
Cliente >> mascotasConVacunasVencidas [
^ colMascotas select: [ :mascota | mascota tieneVacunaVencida ]
	
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
