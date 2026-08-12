Class {
	#name : 'MedioPago',
	#superclass : 'Object',
	#instVars : [
		'nombre'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
MedioPago class >> crearConNombre: unNombre [
	|unMedio|
		unMedio := self new.
		unMedio inicializarConNombre: unNombre .
^unMedio .
]

{ #category : 'getters' }
MedioPago >> getNombre [
^nombre.
]

{ #category : 'getters' }
MedioPago >> getRecargo [
^0.
]

{ #category : 'initialization' }
MedioPago >> inicializarConNombre: unNombre [
	( { 'efectivo' . 'transferencia' . 'tarjetaDebito' } includes: unNombre ) ifTrue: [ nombre := unNombre ].
]
