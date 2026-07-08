Class {
	#name : 'Factura',
	#superclass : 'Object',
	#instVars : [
		'cliente',
		'diagnostico',
		'montoTotal',
		'fecha',
		'colPagos',
		'cuitVeterinaria'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
Factura class >> crearConCliente: cliente conDiagnostico: diagnostico conMontoTotal: monto conCuitVeterinaria: unCuit [
	|factura|
		factura := self new.
		factura inicializarConCliente: cliente conDiagnostico: diagnostico conMontoTotal: monto conCuitVeterinaria: unCuit.
		^factura.
]

{ #category : 'getters' }
Factura >> getCliente [
^cliente.
]

{ #category : 'getters' }
Factura >> getCuitVeterinaria [
^cuitVeterinaria.
]

{ #category : 'getters' }
Factura >> getDiagnostico [
^diagnostico.
]

{ #category : 'getters' }
Factura >> getFecha [
^fecha.
]

{ #category : 'getters' }
Factura >> getMontoTotal [
^montoTotal.
]

{ #category : 'initialization' }
Factura >> inicializarConCliente: unCliente conDiagnostico: unDiagnostico conMontoTotal: monto conCuitVeterinaria: unCuit [
	cliente := unCliente.
	diagnostico := unDiagnostico.
	montoTotal := monto.
	cuitVeterinaria := unCuit.
	fecha := Date today .
	colPagos := OrderedCollection new.
]

{ #category : 'propiosDelTipo' }
Factura >> registraPago: unPago [
	|exito|
		(self verificarSaldoPendiente > 0) ifTrue: [ colPagos add: unPago. exito := true. ] ifFalse: [ exito := false ].
^exito.
]

{ #category : 'propiosDelTipo' }
Factura >> tieneDiagnostico: unDiagnostico [
^((unDiagnostico getId) = (diagnostico getId)).
]

{ #category : 'propiosDelTipo' }
Factura >> verificarSaldoPendiente [
	|montoAbonado|
		montoAbonado := colPagos inject: 0 into: [ :suma :pago | suma + pago getMonto ].
^montoAbonado < montoTotal.
]
