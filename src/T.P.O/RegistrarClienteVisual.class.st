Class {
	#name : 'RegistrarClienteVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'dni',
		'nombre',
		'apellido',
		'domicilio',
		'email',
		'telefono',
		'campoDni',
		'campoNombre',
		'campoApellido',
		'campoDomicilio',
		'campoEmail',
		'campoTelefono',
		'etiqueta',
		'botonCerrar',
		'botonRegistrar',
		'origen'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
RegistrarClienteVisual >> cerrar [
	self delete.
]

{ #category : 'propiosDelTipo' }
RegistrarClienteVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
RegistrarClienteVisual >> initialize [ 
	super initialize.
	self color: (Color fromHexString: '063F70').
	self position: 45@45.
	self bounds: (45@45 extent: 350@420).
	origen := self innerBounds origin.
	
	botonRegistrar := BotonAccion new.
	self addMorph: botonRegistrar .
	botonRegistrar mouseAction: [ self registrar ].	
	botonRegistrar position: (330@105).
	botonRegistrar label: 'Registrar'.
	
	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [ self cerrar ].
	botonCerrar position: (330@315).
	botonCerrar label: 'Cerrar'.
	
	etiqueta := LabelMorph new.
	self addMorph: etiqueta.
	etiqueta contents: 'Ingrese los Datos.'.
	etiqueta position: origen + (5@15).
	etiqueta color: Color white.
	
	campoDni := LabelWithTextFieldMorph new.
	self addMorph: campoDni.
	campoDni label: 'Dni:'.
	campoDni position: origen + (20@40).

	campoNombre := LabelWithTextFieldMorph new.
	self addMorph: campoNombre.
	campoNombre label: 'Nombre:'.
	campoNombre position: campoDni position + (0@60).
	
	campoApellido := LabelWithTextFieldMorph new.
	self addMorph: campoApellido.
	campoApellido label: 'Apellido:'.
	campoApellido position: campoNombre position + (0@60).
	
	campoDomicilio := LabelWithTextFieldMorph new.
	self addMorph: campoDomicilio .
	campoDomicilio label: 'Domicilio:'.
	campoDomicilio position: campoApellido position + (0@60).	
	
	campoEmail := LabelWithTextFieldMorph new.
	self addMorph: campoEmail .
	campoEmail label: 'Email:'.
	campoEmail position: campoDomicilio position + (0@60).
	
	campoTelefono := LabelWithTextFieldMorph new.
	self addMorph: campoTelefono .
	campoTelefono label: 'Telefono:'.
	campoTelefono position: campoEmail position + (0@60).
]

{ #category : 'propiosDelTipo' }
RegistrarClienteVisual >> registrar [
	|cliente registrado|
	( self validarDni and: [ self validarCampos ] ) ifFalse: [ registrado := false. self informar: 'Completar los datos de forma correcta.' ] 
	ifTrue: [
		dni := (campoDni contents) asNumber.
		nombre := campoNombre contents.
		apellido := campoApellido contents.
		domicilio := campoDomicilio contents.
		email := campoEmail contents.
		telefono := campoTelefono contents.
		cliente := Cliente crearConNombre: nombre conApellido: apellido conNroDni: dni conDomicilio: domicilio conEmail: email conTelefono: telefono.
		registrado := veterinaria agregarCliente: cliente.
		registrado ifTrue: [ self informar: 'El cliente se registro con exito.' ] ifFalse: [ self informar: 'El cliente ingresado ya se encuentra registrado.' ].
	]. 
^registrado 
]

{ #category : 'propiosDelTipo' }
RegistrarClienteVisual >> validarCampos [
	|completos|
	completos := { campoNombre . campoApellido . campoDomicilio . campoEmail . campoTelefono } allSatisfy: [ :cadaCampo | cadaCampo contents isNotEmpty ] .
^completos 
	
]

{ #category : 'propiosDelTipo' }
RegistrarClienteVisual >> validarDni [
	| numero valido |
	valido := true.
	campoDni contents isEmpty ifTrue: [
		self informar: 'Debe ingresar un DNI.'.
		valido := false.
	].
	valido ifTrue: [ 
		dni := campoDni contents.
		(dni allSatisfy: [ :c | c isDigit ]) ifFalse: [
		self informar: 'El DNI debe contener únicamente números.'.
		valido := false.
		].
		valido ifTrue: [ 
			numero := dni asNumber.
			((numero > 0) and: [ numero < 100000000 ]) ifFalse: [
			self informar: 'El DNI debe tener entre 1 y 8 dígitos.'.
			valido := false
			].
		].
	].
	^valido
]

{ #category : 'accessing' }
RegistrarClienteVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria 
]
