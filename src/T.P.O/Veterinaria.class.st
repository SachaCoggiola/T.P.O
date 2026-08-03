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

{ #category : 'add' }
Veterinaria >> agregarCliente: unCliente [
	|cargado|
	cargado := true.
	(colClientes anySatisfy: [ :cadaCliente | unCliente equals: cadaCliente ]) 
		ifFalse: 
			[ 	colClientes add: unCliente ] 
		ifTrue: 
			[ cargado := false ].
	^cargado 
		
	
]

{ #category : 'add' }
Veterinaria >> agregarDiagnostico: unDiagnostico [
	|cargado|
	cargado := true.
	(colDiagnosticos anySatisfy: [ :cadaDiagnostico | unDiagnostico equals: cadaDiagnostico ]) 
		ifFalse: 
			[ 	colDiagnosticos add: unDiagnostico ] 
		ifTrue: 
			[ cargado := false ].
	^cargado 
]

{ #category : 'add' }
Veterinaria >> agregarMedico: unMedico [
	colMedicos add: unMedico.
]

{ #category : 'add' }
Veterinaria >> agregarTurno: unTurno [
"METODO TEMPORAL"
colTurnos add: unTurno .
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
Veterinaria >> buscarClienteConDni: unDni [
	|cliente|
	cliente := colClientes detect: [ :cadaCliente | cadaCliente getDni = unDni ] ifNone: nil.
^cliente 
]

{ #category : 'propiosDelTipo' }
Veterinaria >> buscarClienteConMascota: unaMascota [
	|cliente|
		cliente := colClientes detect: [ :unCliente | unCliente tieneMascota: unaMascota ] ifNone: nil.
^cliente.
		
]

{ #category : 'propiosDelTipo' }
Veterinaria >> buscarDiagnosticoConId: unId [
	|diagnostico|
	diagnostico := colDiagnosticos detect: [ :cadaDiagnostico | cadaDiagnostico getId = unId ] ifNone: [ nil ].
^diagnostico 

]

{ #category : 'propiosDelTipo' }
Veterinaria >> buscarMascotaConId: unId [
	|mascota|
	mascota := nil.
	colClientes do: [:cadaCliente |
		mascota ifNil: [
			mascota := cadaCliente buscarMascotaConId: unId
		].
	].
^mascota 

]

{ #category : 'propiosDelTipo' }
Veterinaria >> buscarMedicamento: unNombre [
	|medicamento aux|
	aux := colStockMedicamentos detect: [ :stock | (stock getMedicamento getNombre) = unNombre ].
	medicamento := aux getMedicamento.
	^medicamento 
]

{ #category : 'propiosDelTipo' }
Veterinaria >> buscarMedicoConDni: unDni [
	|medico|
	medico := colMedicos detect: [ :cadaMedico | cadaMedico getDni = unDni ] ifNone: nil.
^medico 
]

{ #category : 'propiosDelTipo' }
Veterinaria >> cancelarTurnoPendiente: unTurno [
|turnoBuscado rta|
  rta := false.
  turnoBuscado := colTurnos detect: [ :cadaTurno | cadaTurno equals: unTurno ] 
                            ifNone: [ nil ].
  turnoBuscado ifNotNil: [ rta := (turnoBuscado cancelarTurno) ].
^rta. 
]

{ #category : 'propiosDelTipo' }
Veterinaria >> facturasPendientes [	
	|listaPendientes|
	listaPendientes := colFacturas select: [ :facturas |facturas verificarSaldoPendiente > 0].
	^listaPendientes collect: [ :pendiente | { pendiente getCliente . pendiente verificarSaldoPendiente } ]. 
]

{ #category : 'propiosDelTipo' }
Veterinaria >> facturasPendientesCliente: elCliente [
|listaPendientesCliente listaFacturasCliente|
  listaFacturasCliente := OrderedCollection new.
  listaPendientesCliente := OrderedCollection new.
  
  listaFacturasCliente := colFacturas select: 
                          [ :unaFactura | unaFactura tieneCliente: elCliente ].

  listaPendientesCliente := listaFacturasCliente select: 
                            [ :unaFactura | (unaFactura verificarSaldoPendiente) > 0 ].

^listaPendientesCliente .
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

{ #category : 'propiosDelTipo' }
Veterinaria >> historialClinicoDe: unaMascota [
|listaDiagnosticosMascota|
  listaDiagnosticosMascota := OrderedCollection new.
  listaDiagnosticosMascota := colDiagnosticos select: 
                              [ :unDiagnostico | unDiagnostico tieneMascota: unaMascota ].
^listaDiagnosticosMascota .
]

{ #category : 'propiosDelTipo' }
Veterinaria >> historialTurnosDe: unCliente [
|listaTurnosCliente|
  listaTurnosCliente := OrderedCollection new.
  listaTurnosCliente := colTurnos select: [ 
	:unTurno | unTurno tieneCliente: unCliente ].
^listaTurnosCliente .
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

{ #category : 'propiosDelTipo' }
Veterinaria >> listarTratamientosMedico: unMedico [
|listaTratamientosMedico|
  listaTratamientosMedico := OrderedCollection new.

  colDiagnosticos do: [ :unDiagnostico | 
	(unDiagnostico tieneMedico: unMedico) ifTrue: 
	  [ listaTratamientosMedico addAllLast: unDiagnostico getColTratamientos ].
  ].

^listaTratamientosMedico .
  
]

{ #category : 'propiosDelTipo' }
Veterinaria >> listarTurnosFecha: unaFecha [
|listaTurnosFecha|
  listaTurnosFecha := OrderedCollection new.
  listaTurnosFecha := colTurnos select: [ :cadaTurno | cadaTurno tieneFecha: unaFecha ].
^listaTurnosFecha .
]

{ #category : 'propiosDelTipo' }
Veterinaria >> mascotasConVacunasVencidas [
	|listaMascotas|
	listaMascotas := OrderedCollection new.
	listaMascotas := colClientes collect: [ :cliente | cliente mascotasConVacunasVencidas ].
	^listaMascotas
]

{ #category : 'propiosDelTipo' }
Veterinaria >> registrarTratamiento: unTratamiento conDiagnostico: unDiagnostico [
	|registrado medicamento dosis|
	registrado := unTratamiento esValido.
	(registrado) ifTrue: [ 
		(unTratamiento esFarmacologico) ifTrue: [
			medicamento := unTratamiento getMedicamento.
			dosis := unTratamiento getDosis.
			registrado := self revisarStock: medicamento Y: dosis.
			].
		registrado := unDiagnostico agregarTratamiento: unTratamiento. 
	].
^registrado 
]

{ #category : 'propiosDelTipo' }
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
	rta := colDiagnosticos anySatisfy: [:cadaDiagnostico | cadaDiagnostico                                                          tieneTratamiento: unTratamiento ].

	rta  ifTrue: [ 
		esValido := (unTratamiento getEstado = 'pendiente').
	].

^esValido .
]
