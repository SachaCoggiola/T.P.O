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

{ #category : 'as yet unclassified' }
Pago >> getMonto [
	^montoAbonado + (montoAbonado * unMedioPago getRecargo / 100).
]
