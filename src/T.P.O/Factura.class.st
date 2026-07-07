Class {
	#name : 'Factura',
	#superclass : 'Object',
	#instVars : [
		'cliente',
		'diagnostico',
		'montoTotal',
		'fecha',
		'colPagos'
	],
	#classInstVars : [
		'cuitVeterinaria'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
Factura class >> crearConCliente: cliente conDiagnostico: diagnostico conMontoTotal: monto conFecha: fecha conPago: unPago [
	|factura|
		factura := self new.
		cuitVeterinaria := '30123456'.
		factura inicializarConCliente: cliente conDiagnostico: diagnostico conMontoTotal: monto conFecha: fecha conPago: unPago.
		^factura.
]

{ #category : 'as yet unclassified' }
Factura >> getCliente [
	^cliente.
]

{ #category : 'initialization' }
Factura >> inicializarConCliente: unCliente conDiagnostico: unDiagnostico conMontoTotal: monto conFecha: unaFecha conPago: unPago [
	cliente := unCliente.
	diagnostico := unDiagnostico.
	montoTotal := monto.
	fecha := unaFecha.
	colPagos := OrderedCollection new.
	colPagos add: unPago.
]

{ #category : 'as yet unclassified' }
Factura >> registraPago: unPago [
	|exito|
		(self verificarSaldoPendiente > 0) ifTrue: [ colPagos add: unPago. exito := true. ] ifFalse: [ exito := false ].
		^exito.
]

{ #category : 'as yet unclassified' }
Factura >> verificarSaldoPendiente [
	|montoAbonado|
		montoAbonado := colPagos inject: 0 into: [ :suma :pago | suma + pago getMonto ].
		^montoAbonado < montoTotal.
]
