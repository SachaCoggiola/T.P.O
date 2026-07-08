Class {
	#name : 'Pago',
	#superclass : 'Object',
	#instVars : [
		'fecha',
		'montoAbonado',
		'unMedioPago'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'getters' }
Pago >> getFecha [
^fecha.
]

{ #category : 'as yet unclassified' }
Pago >> getMedioDePago [
^unMedioPago.
]

{ #category : 'getters' }
Pago >> getMonto [
^montoAbonado + (montoAbonado * unMedioPago getRecargo / 100).
]
