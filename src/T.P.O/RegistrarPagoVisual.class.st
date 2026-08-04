Class {
	#name : 'RegistrarPagoVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'monto',
		'medioPago',
		'factura',
		'cliente',
		'diagnostico',
		'campoMonto',
		'campoMedioPago',
		'campoCliente',
		'campoDiagnostico',
		'etiqueta',
		'botonBuscarFactura',
		'botonCerrar',
		'botonRegistrar',
		'origen'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
RegistrarPagoVisual >> buscarFactura [
	|dni id|
	dni := campoCliente contents.
	(dni trimBoth isEmpty) ifFalse: [
		(dni allSatisfy: [ :c | c isDigit ]) ifFalse: [
			self informar: 'El DNI debe contener únicamente números.'.
		] ifTrue: [
			id := campoDiagnostico contents.
			(id trimBoth isEmpty) ifFalse: [
				(id allSatisfy: [ :c | c isDigit ]) ifFalse: [
					self informar: 'El ID debe contener únicamente números.'.
				] ifTrue: [
					cliente := veterinaria buscarClienteConDni: dni asNumber.
					diagnostico := veterinaria buscarDiagnosticoConId: id asNumber.
					cliente 
					ifNotNil: [ 
						diagnostico 
						ifNotNil: [ 
							factura := veterinaria buscarFacturaConCliente: cliente conDiagnostico: diagnostico.
							factura ifNotNil: [self informar: 'Factura encontrada'] ifNil: [ self informar: 'Factura no encontrada' ] 
						] 
						ifNil: [ 
							self informar: 'No se ha encontrado un diagnostico con el ID ingresado'
						].
					]
					ifNil: [ 
						self informar: 'No se ha encontrado un cliente con el DNI ingresado'
					].  
				]
			] ifTrue: [ self informar: 'Ingrese el ID del diagnostico' ]
		].
	] ifTrue: [ self informar: 'Ingrese el DNI del cliente' ]
]

{ #category : 'propiosDelTipo' }
RegistrarPagoVisual >> cerrar [ 
	self delete
]

{ #category : 'propiosDelTipo' }
RegistrarPagoVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
RegistrarPagoVisual >> initialize [
	|mediosPago|
	mediosPago := OrderedCollection new.
	mediosPago add: 'Billetera Virtual'.
	mediosPago add: 'Tarjeta Credito'.
	mediosPago add: 'Tarjeta Debito'.
	mediosPago add: 'Efectivo'.
	mediosPago add: 'Transferencia'. 
	super initialize.
	self color: (Color fromHexString: '024a86').
	self position: 45@45.
	self bounds: (45@45 extent: 350@420).
	origen := self innerBounds origin.
	
	botonRegistrar := BotonAccion new.
	self addMorph: botonRegistrar .
	botonRegistrar mouseAction: [ self registrar ].	
	botonRegistrar position: (280@105).
	botonRegistrar label: 'Registrar'.
	
	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [ self cerrar ].
	botonCerrar position: (280@350).
	botonCerrar label: 'Cerrar'.
		
	etiqueta := LabelMorph new.
	self addMorph: etiqueta.
	etiqueta contents: 'Ingrese los Datos.'.
	etiqueta position: origen + (5@15).
	etiqueta color: Color black .
	
	campoMonto := LabelWithTextFieldMorph new.
	self addMorph: campoMonto.
	campoMonto label: 'Monto abonado:'.
	campoMonto position: origen + (20@40).
	
	campoCliente := LabelWithTextFieldMorph new.
	self addMorph: campoCliente.
	campoCliente label: 'Dni del cliente:'.
	campoCliente position: campoMonto position + (0@60).

	campoDiagnostico := LabelWithTextFieldMorph new.
	self addMorph: campoDiagnostico.
	campoDiagnostico label: 'Id del diagnostico:'.
	campoDiagnostico position: campoCliente position + (0@60).

	campoMedioPago := DropListMorph new.
	campoMedioPago list: mediosPago.
	campoMedioPago position: campoDiagnostico position + (0@60).
	campoMedioPago extent: (150@25).
	self addMorph: campoMedioPago.
	
	botonBuscarFactura := BotonAccion new.
	self addMorph: botonBuscarFactura .
	botonBuscarFactura mouseAction: [ self buscarFactura ].	
	botonBuscarFactura position: (280@210).
	botonBuscarFactura label: 'Buscar factura'.
]

{ #category : 'propiosDelTipo' }
RegistrarPagoVisual >> registrar [
	|pago registrado|
	registrado := false.
	monto := campoMonto.
	medioPago := campoMedioPago selectedItem.
	monto ifNil: [ self informar: 'Ingrese el monto abonado' ] 
	ifNotNil: [ 
		medioPago ifNil: [ self informar: 'Ingrese un medio de pago' ] 
		ifNotNil: [ 
			factura ifNil: [ self informar: 'Debe de buscar la factura en la cual quiera registrar el pago' ] 
			ifNotNil: [ 
				pago := Pago crearConMonto: monto conMedioPago: medioPago.
				registrado := factura registrarPago: pago.
				registrado ifTrue: [ self informar: 'El pago se registro exitosamente' ] ifFalse: [ self informar: 'No se pudo registrar el pago' ]
			]
		] 
	].
^registrado 
]

{ #category : 'accessing' }
RegistrarPagoVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria 
]
