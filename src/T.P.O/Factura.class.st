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
Factura >> registrarPago: unPago [
	|exito|
		(self verificarSaldoPendiente > 0) 
		ifTrue: [ colPagos add: unPago. 
			       exito := true. ] 
		ifFalse: [ exito := false ].
^exito.
]

{ #category : 'propiosDelTipo' }
Factura >> tieneCliente: unCliente [
^cliente equals: unCliente.
]

{ #category : 'propiosDelTipo' }
Factura >> tieneDiagnostico: unDiagnostico [
^(diagnostico equals: unDiagnostico).
]

{ #category : 'propiosDelTipo' }
Factura >> tienePago: unPago [
^colPagos includes: unPago
]

{ #category : 'propiosDelTipo' }
Factura >> toString [
^('Cliente: ', cliente toString, String cr,
'Diagnostico: ', diagnostico toString, String cr,
'Monto: ', montoTotal asString, String cr,
'Fecha: ', fecha asString, String cr,
'CUIT Veterinaria: ', cuitVeterinaria asString)
]

{ #category : 'propiosDelTipo' }
Factura >> verificarSaldoPendiente [
|montoAbonado saldoPendiente|
	saldoPendiente := 0.
	montoAbonado := colPagos inject: 0 into: [ :suma :pago | suma + (pago getMonto) ].
   (montoAbonado < montoTotal) ifTrue: [ saldoPendiente := (montoTotal - montoAbonado) ].
^saldoPendiente .
]
