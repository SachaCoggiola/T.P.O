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

{ #category : 'creation' }
Factura class >> crearConCliente: cliente conDiagnostico: diagnostico conMontoTotal: monto conFecha: fecha [
	|factura|
		factura := self new.
		cuitVeterinaria := '30123456'.
		factura inicializarConCliente: cliente conDiagnostico: diagnostico conMontoTotal: monto conFecha: fecha.
		^factura.
]

{ #category : 'initialization' }
Factura >> inicializarConCliente: unCliente conDiagnostico: unDiagnostico conMontoTotal: monto conFecha: unaFecha [
	cliente := unCliente.
	diagnostico := unDiagnostico.
	montoTotal := monto.
	fecha := unaFecha.
	colPagos := OrderedCollection new.
]
