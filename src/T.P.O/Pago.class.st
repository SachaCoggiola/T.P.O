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
Pago class >> crearConMonto: unMonto conMedioPago: medioPago [
	|pago|
	pago := self new.
	pago inicializarConMonto: unMonto conMedioPago: medioPago.
^pago
]

{ #category : 'getters' }
Pago >> getFecha [
^fecha.
]

{ #category : 'getters' }
Pago >> getMedioDePago [
^unMedioPago.
]

{ #category : 'getters' }
Pago >> getMonto [
^(montoAbonado + ((montoAbonado * (unMedioPago getRecargo)) / 100)).
]

{ #category : 'initialization' }
Pago >> inicializarConMonto: unMonto conMedioPago: medioPago [
	montoAbonado := unMonto.
	unMedioPago := medioPago.
	fecha := Date today.
]
