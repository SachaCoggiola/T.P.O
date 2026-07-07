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
MedioPago class >> crearCon: unNombre [
|unMedio|
unMedio := self new.
unMedio inicializarCon: unNombre .
^unMedio .
]

{ #category : 'as yet unclassified' }
MedioPago >> getRecargo [
	^0.
]

{ #category : 'initialization' }
MedioPago >> inicializarCon: unNombre [
"[(unNombre = 'efectivo') or: [(unNombre = 'transferencia')] or: [(unNombre = 'tarjetaDebito')] or: [(unNombre = 'tarjetaCredito')] or: [(unNombre = 'billeteraVirtual')]] ifTrue: [nombre := unNombre]."
nombre := unNombre .
]
