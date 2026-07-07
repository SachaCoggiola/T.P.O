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
Factura class >> crearConCliente: cliente conDiagnostico: diagnostico conMontoTotal: monto conCuitVeterinaria: unCuit [
	|factura|
		factura := self new.
		cuitVeterinaria := unCuit.
		factura inicializarConCliente: cliente conDiagnostico: diagnostico conMontoTotal: monto.
		^factura.
]

{ #category : 'initialization' }
Factura >> inicializarConCliente: unCliente conDiagnostico: unDiagnostico conMontoTotal: monto [
	cliente := unCliente.
	diagnostico := unDiagnostico.
	montoTotal := monto.
	fecha := Date today .
	colPagos := OrderedCollection new.
]

{ #category : 'propiosDelTipo' }
Factura >> tieneDiagnostico: unDiagnostico [
^((unDiagnostico getId) = (diagnostico getId)).
]
