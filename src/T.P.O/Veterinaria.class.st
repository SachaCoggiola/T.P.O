Class {
	#name : 'Veterinaria',
	#superclass : 'Object',
	#instVars : [
		'colFacturas',
		'colTurnos',
		'colClientes',
		'colMedicos',
		'colDiagnosticos',
		'colStockMedicamentos',
		'cuit'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
Veterinaria class >> crearConCuit: unCuit [
	|veterinaria|
		veterinaria := self new.
		veterinaria inicializarCuit: unCuit.
		^veterinaria 
]

{ #category : 'propiosDelTipo' }
Veterinaria >> agendarTurno: unTurno [
	|exito disponible|
	exito := false.
	( unTurno validarTurno ) ifTrue: [ 
		disponible := colTurnos anySatisfy: [ :cadaTurno | (cadaTurno verificarDisponibilidad: unTurno) not ].
		disponible ifTrue: [ 
	  		( unTurno verificarMascota ) ifTrue: [ 
				exito := true.
				( unTurno tieneTratamiento ) ifTrue: [ 
		 	 		exito := self verificarTratamiento: unTurno getTratamiento .
		 		].
	  		].
   		].
   exito ifTrue: [
		colTurnos add: unTurno .
		unTurno confirmarTurno.
		].
	].

^exito.
]

{ #category : 'propiosDelTipo' }
Veterinaria >> agregarCliente: unCliente [
	colClientes add: unCliente.
]

{ #category : 'propiosDelTipo' }
Veterinaria >> agregarDiagnostico: unDiagnostico [
	colDiagnosticos add: unDiagnostico.
]

{ #category : 'propiosDelTipo' }
Veterinaria >> agregarMedico: unMedico [
	colMedicos add: unMedico.
]

{ #category : 'propiosDelTipo' }
Veterinaria >> buscarCliente: unDiagnostico [
	|elCliente unaMascota|
		elCliente := nil.
		unaMascota := unDiagnostico getMascota .
		elCliente := colClientes detect: [ :cadaCliente | cadaCliente tieneMascota: unaMascota ] ifNone: [ nil ].
^elCliente .

]

{ #category : 'propiosDelTipo' }
Veterinaria >> buscarClienteConMascota: unaMascota [
	|cliente|
		cliente := colClientes detect: [ :unCliente | unCliente tieneMascota: unaMascota ] ifNone: nil.
^cliente.
		
]

{ #category : 'propiosDelTipo' }
Veterinaria >> facturasPendientes [	
	^(colFacturas select: [ :facturas |facturas verificarSaldoPendiente > 0]) collect: [ :pendiente |{pendiente getCliente . pendiente verificarSaldoPendiente } ].
]

{ #category : 'propiosDelTipo' }
Veterinaria >> generarFactura: unDiagnostico [
	|exito rta unCliente laFactura montoTotal|
		exito := false.
		laFactura := nil.
		rta := colFacturas anySatisfy: [ :cadaFactura | cadaFactura tieneDiagnostico: unDiagnostico ].
		rta ifFalse: [ 
			unCliente := self buscarCliente: unDiagnostico.
			unCliente ifNotNil: [
				montoTotal := unDiagnostico calcularMontoFinal.
				laFactura := Factura crearConCliente: unCliente conDiagnostico: unDiagnostico conMontoTotal: montoTotal conCuitVeterinaria: cuit.
				exito := true.
				colFacturas add: laFactura.
				].
			].
^exito.
]

{ #category : 'getters' }
Veterinaria >> getCuit [
^cuit.
]

{ #category : 'initialization' }
Veterinaria >> inicializarCuit: unCuit [
	cuit := unCuit.
	colFacturas := OrderedCollection new.
	colTurnos := OrderedCollection new.
	colClientes := OrderedCollection new.
	colMedicos := OrderedCollection new.
	colDiagnosticos := OrderedCollection new.
	colStockMedicamentos := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
Veterinaria >> mascotasConVacunasVencidas [
	|listaMascotas|
	listaMascotas := OrderedCollection new.
	listaMascotas := colClientes collect: [ :cliente | cliente mascotasConVacunasVencidas ].
	^listaMascotas
]

{ #category : 'as yet unclassified' }
Veterinaria >> registrarTratamiento: unTratamiento conDiagnostico: unDiagnostico [
	|registrado medicamento dosis|
	registrado := unTratamiento esValido.
	(registrado) ifTrue: [ 
		(unTratamiento esFarmacologico) ifTrue: [
			medicamento := unTratamiento getMedicamento.
			dosis := unTratamiento getDosis.
			registrado := self revisarStock: medicamento Y: dosis.
			] 
		].
	(registrado) ifTrue: [ unDiagnostico agregarTratamiento: unTratamiento ].
	^registrado 
]

{ #category : 'as yet unclassified' }
Veterinaria >> revisarStock: medicamento Y: dosis [
	|medicina hayStock|
	hayStock := false.
	medicina := colStockMedicamentos detect: [ :stock | medicamento equals: (stock getMedicamento) ].
	medicina ifNotNil: [ hayStock := (medicina getCantidad) > dosis ] ifNil: [ hayStock := false ].
	^hayStock.
]

{ #category : 'propiosDelTipo' }
Veterinaria >> verificarTratamiento: unTratamiento [
	|esValido rta|
	esValido := false.
	rta := colDiagnosticos anySatisfy: [:cadaDiagnostico | cadaDiagnostico tieneTratamiento: unTratamiento ].

	rta  ifTrue: [ 
		esValido := (unTratamiento getEstado = 'pendiente').
	].

^esValido .
]
