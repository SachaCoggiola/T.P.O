Class {
	#name : 'TarjetaCred',
	#superclass : 'MedioPago',
	#classVars : [
		'recargo'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
TarjetaCred class >> crearConNombre [
	|unaTarjetaCred|
		unaTarjetaCred := self new.
		unaTarjetaCred inicializarTarjetaCred.
^unaTarjetaCred .
]

{ #category : 'getters' }
TarjetaCred >> getRecargo [ 
^recargo.
]

{ #category : 'initialization' }
TarjetaCred >> inicializarTarjetaCred [
	nombre := 'tarjetaCredito'.
	recargo ifNil: [ recargo := 10 ].
]
