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
TarjetaCred class >> crearConNombre: unNombre [
|unaTarjetaCred|
unaTarjetaCred := self crearCon: unNombre .
recargo := 10.
^unaTarjetaCred .
]

{ #category : 'as yet unclassified' }
TarjetaCred >> getRecargo [ 
	^recargo.
]
