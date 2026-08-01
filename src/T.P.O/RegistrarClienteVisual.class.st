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
		'paso',
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
	self color: Color darkGray.
	self position: 45@45.
	self bounds: (45@45 extent: 350@420).
	origen := self innerBounds origin.
	paso := 1.
	
	botonRegistrar := BotonAccion new.
	self addMorph: botonRegistrar .
	botonRegistrar mouseAction: [ self registrar ].
	botonRegistrar position: origen + (10@10).
	
	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [ self cerrar ].
	
	etiqueta := LabelMorph new.
	self addMorph: etiqueta.
	etiqueta contents: 'Ingrese los Datos.'.
	
]

{ #category : 'propiosDelTipo' }
RegistrarClienteVisual >> registrar [
	|cliente registrado|
	dni := campoDni contents.
	nombre := campoNombre contents.
	apellido := campoApellido contents.
	domicilio := campoDomicilio contents.
	email := campoEmail contents.
	telefono := campoTelefono contents.
	cliente := Cliente crearConNombre: nombre conApellido: apellido conNroDni: dni conDomicilio: domicilio conEmail: email conTelefono: telefono conMascota: nil.
	registrado := veterinaria agregarCliente: cliente.
	registrado ifTrue: [ self informar: 'El cliente se registro con exito.' ] ifFalse: [ self informar: 'El cliente ingresado ya se encuentra registrado.' ].
	self cerrar. 
]

{ #category : 'propiosDelTipo' }
RegistrarClienteVisual >> validarDni [
   | numero valido |
	valido := true.
   campoDni contents isEmpty ifTrue: [
       self informar: 'Debe ingresar un DNI.'.
       valido := false.
   ].
   dni := campoDni contents.
   (dni allSatisfy: [ :c | c isDigit ]) ifFalse: [
       self informar: 'El DNI debe contener únicamente números.'.
       valido := false.
   ].
   numero := dni asNumber.
   ((numero > 0) and: [ numero < 100000000 ]) ifFalse: [
       self informar: 'El DNI debe tener entre 1 y 8 dígitos.'.
       valido := false
   ].
	^valido
]

{ #category : 'accessing' }
RegistrarClienteVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria 
]
