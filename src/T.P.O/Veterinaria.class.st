Class {
	#name : 'Veterinaria',
	#superclass : 'Object',
	#instVars : [
		'colFacturas',
		'colTurnos',
		'colClientes',
		'colMedicos',
		'colAplicacions',
		'colDiagnosticos',
		'colMedicamentos',
		'cuit'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
Veterinaria class >> crearVeterinariaConCuit: unCuit [
	|veterinaria|
		veterinaria := self new.
		veterinaria inicializarCuit: unCuit.
		^veterinaria 
]

{ #category : 'as yet unclassified' }
Veterinaria >> buscarClienteConMascota: unaMascota [
	|cliente|
		cliente := colClientes detect: [ cliente tieneMascota: unaMascota ] ifNone: nil.
		
]

{ #category : 'as yet unclassified' }
Veterinaria >> facturasPendientes [	
	^(colFacturas select: [ :facturas |facturas verificarSaldoPendiente > 0]) collect: [ :pendiente |{pendiente getCliente . pendiente verificarSaldoPendiente } ].
]

{ #category : 'as yet unclassified' }
Veterinaria >> inicializarCuit: unCuit [
	cuit := unCuit.
	colFacturas := OrderedCollection new.
	colTurnos := OrderedCollection new.
	colClientes := OrderedCollection new.
	colMedicos := OrderedCollection new.
	colAplicacions := OrderedCollection new.
	colDiagnosticos := OrderedCollection new.
	colMedicamentos := OrderedCollection new.
]
