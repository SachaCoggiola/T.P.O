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
		'cuit',
		'nombre'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
Veterinaria class >> crearConCuit: unCuit conNombre: unNombre [
	|veterinaria|
		veterinaria := self new.
		veterinaria inicializarCuit: unCuit conNombre: unNombre.
		^veterinaria 
]

{ #category : 'propiosDelTipo' }
Veterinaria >> agendarTurno: unTurno [
	|exito disponible|
	exito := false.
	( unTurno validarTurno ) ifTrue: [ 
		disponible := (colTurnos anySatisfy: [ :cadaTurno | (cadaTurno verificarDisponibilidad: unTurno) not ]) not.
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
	|cargado|
	cargado := true.
	(colMedicos anySatisfy: [ :cadaMedico | cadaMedico equals: unMedico ]) 
		ifFalse: 
			[ 	colMedicos add: unMedico ] 
		ifTrue: 
			[ cargado := false ].
	^cargado 
]

{ #category : 'add' }
Veterinaria >> agregarStock: unStock [
	|cargado|
	cargado := true.
	(colStockMedicamentos anySatisfy: [ :cadaStock | cadaStock equals: unStock ]) 
		ifFalse: 
			[ colStockMedicamentos add: unStock ] 
		ifTrue: 
			[ cargado := false ].
	^cargado 
]

{ #category : 'add' }
Veterinaria >> agregarTurno: unTurno [
colTurnos add: unTurno
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
Veterinaria >> buscarFacturaConCliente: cliente conDiagnostico: diagnostico [
	|factura|
	factura := colFacturas detect: [:cadaFactura | (cadaFactura getCliente equals: cliente) and: (cadaFactura getDiagnostico equals: diagnostico) ] ifNone: [ nil ] .
^factura 
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
Veterinaria >> buscarTratamientoConFecha: fechaObjeto yMotivo: motivo [
|trat|
trat := Quirurgico crearConNombre: '' conNivelRiesgo: 0 conTipoAnestesia: '' conFecha: fechaObjeto conMotivo: motivo.
trat := colDiagnosticos detect: [:diag | (diag tieneTratamiento: trat) ] ifNone: [ nil ] .
^trat.
]

{ #category : 'propiosDelTipo' }
Veterinaria >> buscarTurnoConFecha: unaFecha yHora: unaHora yDniMedico: unDNI [
|turno|
	turno := colTurnos detect: [ :cadaTurno | 
		   (cadaTurno getFecha = unaFecha) and:
		   [(cadaTurno getHora = unaHora) and: 
			(cadaTurno tieneMedico: (self buscarMedicoConDni: unDNI) ) ] ] 
	ifNone: [nil].
^turno 
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
Veterinaria >> cantMascotas [
^(colClientes inject: 0 into: [:total :cliente | total + cliente cantMascotas])
]

{ #category : 'propiosDelTipo' }
Veterinaria >> facturasPendientes [	
	|listaPendientes|
	listaPendientes := colFacturas select: [ :facturas |facturas verificarSaldoPendiente > 0].
	^listaPendientes collect: [ :pendiente | { pendiente getCliente . pendiente verificarSaldoPendiente } ]. 
]

{ #category : 'propiosDelTipo' }
Veterinaria >> facturasPendientesCliente: arg1 [

	| tmp1 tmp2 |
	tmp2 := OrderedCollection new.
	tmp1 := OrderedCollection new.
	tmp2 := colFacturas select: [ :arg2 | arg2 tieneCliente: arg1 ].
	tmp1 := tmp2 select: [ :arg3 | arg3 verificarSaldoPendiente > 0 ].
	^ tmp1
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

{ #category : 'getters' }
Veterinaria >> getNombre [
^nombre
]

{ #category : 'propiosDelTipo' }
Veterinaria >> historialClinicoDe: arg1 [

	| tmp1 |
	tmp1 := OrderedCollection new.
	tmp1 := colDiagnosticos select: [ :arg2 | arg2 tieneMascota: arg1 ].
	^ tmp1
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
Veterinaria >> inicializarCuit: unCuit conNombre: unNombre [
	nombre := unNombre.
	cuit := unCuit.
	colFacturas := OrderedCollection new.
	colTurnos := OrderedCollection new.
	colClientes := OrderedCollection new.
	colMedicos := OrderedCollection new.
	colDiagnosticos := OrderedCollection new.
	colStockMedicamentos := OrderedCollection new.
]

{ #category : 'initialization' }
Veterinaria >> inicializarSistema [
"Para la verificación del funcionamiento correcto del sistema, se debe entregar con un conjunto inicial de datos."
	|medico1 medico2 cliente1 cliente2 cliente3 mascota1 mascota2a mascota2b mascota3 medicamento stock diagnostico1 diagnostico2a diagnostico2b diagnostico3a diagnostico3b tratQuirurgico tratFarmacologico tratFarmacologico2b turno matricula pago fact1 fact2|
	matricula := Matricula crearConNumero: 1058 conColegioEmisor: 'Universidad de Buenos Aires' conFechaInscripcion: (Date year: 1950 month: 5 day: 12) conFechaVigencia: (Date year: 2027 month: 9 day: 3) conTipo: 'Nacional'.

	medico1 := Medico crearConNombre: 'Rene' conApellido: 'Favaloro' conNroDni: 12345678 conDomicilio: 'San martin 550' conFechaNacimiento: (Date year: 1973 month: 7 day: 12)  conCuil: 23123456780 conMatricula: matricula.

	matricula := Matricula crearConNumero: 3789 conColegioEmisor: 'Universidad Nacional del Comahue' conFechaInscripcion: (Date year: 2000 month: 8 day: 22) conFechaVigencia: (Date year: 2028 month: 10 day: 23) conTipo: 'Nacional'.
	medico2 := Medico crearConNombre: 'Gregorio' conApellido: 'Alvarez' conNroDni: 87654321 conDomicilio: 'Tucuman 321' conFechaNacimiento: (Date year: 1989 month: 11 day: 28)  conCuil: 23876543210 conMatricula: matricula.
	
	self agregarMedico: medico1 .
	self agregarMedico: medico2.

mascota1 := Mascota crearConNombre: 'Rocky' conEspecie: 'Perro' conRaza: 'Dogo argentino' conFechaNacimiento: (Date year: 2022 month: 2 day: 5) conPeso: 10 conId: 1.
mascota2a := Mascota crearConNombre: 'Marley' conEspecie: 'Perro' conRaza: 'Mixto' conFechaNacimiento: (Date year: 2021 month: 8 day: 11) conPeso: 12 conId: 2.
mascota2b := Mascota crearConNombre: 'Hidan' conEspecie: 'Gato' conRaza: 'Mixto' conFechaNacimiento: (Date year: 2023 month: 8 day: 25) conPeso: 5 conId: 3.
mascota3 := Mascota crearConNombre: 'Niza' conEspecie: 'Perro' conRaza: 'Mixto' conFechaNacimiento: (Date year: 2018 month: 11 day: 12) conPeso: 15 conId: 4.
cliente1 := Cliente crearConNombre: 'Tomas' conApellido: 'Castillo' conNroDni: 30123456 conDomicilio: 'Entre rios 155' conEmail: 'tomascast@gmail.com' conTelefono: 111234567.
cliente2 := Cliente crearConNombre: 'Nicolas' conApellido: 'Torres' conNroDni: 35123456 conDomicilio: 'Islas Malvinas 728' conEmail: 'nicotorres@gmail.com' conTelefono: 2991234567.
cliente3 := Cliente crearConNombre: 'Emiliano' conApellido: 'Martinez' conNroDni: 28123456 conDomicilio: 'Cordoba 1230' conEmail: 'emimart@gmail.com' conTelefono: 117654321.
cliente1 agregarMascota: mascota1.
cliente2 agregarMascota: mascota2a.
cliente2 agregarMascota: mascota2b.
cliente3 agregarMascota: mascota3.

self agregarCliente: cliente1 .
self agregarCliente: cliente2.
self agregarCliente: cliente3.

"mascota 1.1, sin AV  +  1 D con  1 TQ (R2 y A general)"
diagnostico1 := Diagnostico crearConFecha: (Date year: 2026 month: 8 day: 1) conDescripcion: 'Estomago obstruido' conMedico: medico1 conMascota: mascota1 conId: 1.
self agregarDiagnostico: diagnostico1.
tratQuirurgico := Quirurgico crearConNombre: 'Intervercion quirurgica de urgencia, exploracion estomacal' conNivelRiesgo: 2 conTipoAnestesia: 'General' conFecha: (Date year: 2026 month: 8 day: 1) conMotivo: 'Estomago obstruido'.
diagnostico1 agregarTratamiento: tratQuirurgico.

"mascota 2.1 con 1 AV + 1 D con 2 TF"
diagnostico2a := Diagnostico crearConFecha: (Date year: 2026 month: 8 day: 1) conDescripcion: 'Otitis' conMedico: medico1 conMascota: mascota2a conId: 2.
self agregarDiagnostico: diagnostico2a.
medicamento := Medicamento crearConNombre: 'Otifree' conPrecio: 10000 conVentaLibre: true.
stock := StockMedicamento crearConId: 1 conCantidad: 500 conMedicamento: medicamento.
self agregarStock: stock.
tratFarmacologico := Farmacologico crearConMedicamento: medicamento conDosis: 10 conFrecuencia: '8h' conFecha: (Date year: 2026 month: 8 day: 1) conMotivo: 'Tratar Otitis'.
diagnostico2a agregarTratamiento: tratFarmacologico.
medicamento := Medicamento crearConNombre: 'Rostrum' conPrecio: 15000 conVentaLibre: true.
stock := StockMedicamento crearConId: 2 conCantidad: 300 conMedicamento: medicamento.
self agregarStock: stock.
tratFarmacologico := Farmacologico crearConMedicamento: medicamento conDosis: 1 conFrecuencia: '8h' conFecha: (Date year: 2026 month: 8 day: 1) conMotivo: 'Prevenir infeccion'.
diagnostico2a agregarTratamiento: tratFarmacologico.

"mascota 2.2 con 2 AV + 1 D con 1 TF y 1 TQ  (R1 y A local) "
diagnostico2b := Diagnostico crearConFecha: (Date year: 2026 month: 8 day: 1) conDescripcion: 'Lastimadura en ojo izquierdo por pelea' conMedico: medico1 conMascota: mascota2b conId: 3.
tratFarmacologico2b := Farmacologico crearConMedicamento: medicamento conDosis: 1 conFrecuencia: '8h' conFecha: (Date year: 2026 month: 8 day: 1) conMotivo: 'Prevenir infeccion'.
diagnostico2b agregarTratamiento: tratFarmacologico2b.
tratQuirurgico := Quirurgico crearConNombre: 'Coser herida con puntos quirurgicos' conNivelRiesgo: 1 conTipoAnestesia: 'Local' conFecha: (Date year: 2026 month: 8 day: 1) conMotivo: 'Lastimadura en ojo izquierdo por pelea'.
diagnostico2b agregarTratamiento: tratQuirurgico.

"mascota 3.1 con 3 AV + 1 D con 1 TQ + 1 D con 2 TF"
diagnostico3a := Diagnostico crearConFecha: (Date year: 2026 month: 8 day: 15) conDescripcion: 'Lastimadura en pata trasera izquierda, por pelea' conMedico: medico2 conMascota: mascota3 conId: 4.
tratQuirurgico := Quirurgico crearConNombre: 'Coser herida con puntos quirurgicos' conNivelRiesgo: 1 conTipoAnestesia: 'Local' conFecha: (Date year: 2026 month: 8 day: 15) conMotivo: 'Herida en la pata trasera izquierda'.
diagnostico3a agregarTratamiento: tratQuirurgico.

diagnostico3b := Diagnostico crearConFecha: (Date year: 2026 month: 8 day: 15) conDescripcion: 'Lastimadura en pata trasera izquierda, por pelea' conMedico: medico2 conMascota: mascota3 conId: 4.
tratFarmacologico := Farmacologico crearConMedicamento: medicamento conDosis: 1 conFrecuencia: '8h' conFecha: (Date year: 2026 month: 8 day: 1) conMotivo: 'Prevenir infeccion'.
diagnostico3b agregarTratamiento: tratFarmacologico.
medicamento := Medicamento crearConNombre: 'petArmor' conPrecio: 20000 conVentaLibre: true.
stock := StockMedicamento crearConId: 3 conCantidad: 1000 conMedicamento: medicamento.
self agregarStock: stock.
tratFarmacologico := Farmacologico crearConMedicamento: medicamento conDosis: 1 conFrecuencia: '10h' conFecha: (Date year: 2026 month: 8 day: 1) conMotivo: 'Para el dolor'.
diagnostico3b agregarTratamiento: tratFarmacologico.

"El D de la mascota 2.2 facturado y con saldo pendiente"
self generarFactura: diagnostico2b.
pago := Pago crearConMonto: 10000 conMedioPago:(MedioPago crearConNombre: 'Efectivo').
fact1 := (self buscarFacturaConCliente: cliente2 conDiagnostico: diagnostico2b).
fact1 registrarPago: pago.

"El primer  D de la mascota 3.2 facturado y pagado"
self generarFactura: diagnostico3a.
pago := Pago crearConMonto: diagnostico3a calcularMontoFinal conMedioPago:(MedioPago crearConNombre: 'Efectivo').
fact2 := self buscarFacturaConCliente: cliente3 conDiagnostico: diagnostico3a.
fact2 registrarPago: pago.

turno := TurnoConsulta crearConFecha: (Date year: 2026 month: 11 day: 24) yHora: (Time fromString: '14:00') yMotivo: 'Revision general' yCliente: cliente1 yMascota: mascota1 yMedico: medico1 yTipoAtencion: 'General'.
self agregarTurno: turno.
turno cancelarTurno.

turno := TurnoTratamiento crearConFecha: (Date year: 2026 month: 10 day: 24) yHora: (Time fromString: '15:00') yMotivo: 'Revision progreso de la herida' yCliente: cliente2 yMascota: mascota2b yMedico: medico2 yTratamiento: tratFarmacologico2b.
self agendarTurno: turno.

turno := TurnoConsulta crearConFecha: (Date year: 2026 month: 10 day: 3) yHora: (Time fromString: '17:00') yMotivo: 'Revision general' yCliente: cliente3 yMascota: mascota3 yMedico: medico1 yTipoAtencion: 'General'.
self agendarTurno: turno.
turno setEstado: 'atendido'.

^true.
]

{ #category : 'propiosDelTipo' }
Veterinaria >> listarClientes [
|textoResultado|
    textoResultado := colClientes collect: [:cliente | cliente toString, String cr ].
    ^ (textoResultado inject: '' into: [:str :linea | str, linea, String cr]).
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
Veterinaria >> verificarTratamiento: tratamiento [

	| valido tieneTrat |
	valido := false.
	tieneTrat := colDiagnosticos anySatisfy: [ :diagnostico | diagnostico tieneTratamiento: tratamiento ].
	tieneTrat ifTrue: [ valido := tratamiento getEstado = 'pendiente' ].
	^ valido
]
