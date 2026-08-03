Class {
	#name : 'RegistrarMascotaVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'cliente',
		'nombre',
		'especie',
		'raza',
		'fechaNacimiento',
		'peso',
		'id',
		'campoDni',
		'campoNombre',
		'campoEspecie',
		'campoRaza',
		'campoFecha',
		'campoPeso',
		'campoId',
		'etiqueta',
		'botonBuscarCliente',
		'botonCerrar',
		'botonRegistrar',
		'origen'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
RegistrarMascotaVisual >> buscarCliente [
	|contenido|
	contenido := campoDni contents.
	( contenido trimBoth isEmpty ) ifFalse: [
		(contenido allSatisfy: [ :c | c isDigit ]) ifFalse: [
			self informar: 'El DNI debe contener únicamente números.'.
		] ifTrue: [
			cliente := veterinaria buscarClienteConDni: contenido asNumber.
			cliente ifNil: [ self informar: 'No se ha encontrado un cliente con el DNI ingresado' ] ifNotNil: [ self informar: 'Cliente encontrado' ] .
		].
	] ifTrue: [ self informar: 'Ingrese el DNI de un cliente' ]
]

{ #category : 'propiosDelTipo' }
RegistrarMascotaVisual >> cerrar [
	self delete
]

{ #category : 'accessing' }
RegistrarMascotaVisual >> cliente: unCliente [
^cliente := unCliente
]

{ #category : 'propiosDelTipo' }
RegistrarMascotaVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
RegistrarMascotaVisual >> initialize [
	super initialize.
	self color: (Color fromHexString: '024a86').
	self position: 45@45.
	self bounds: (45@45 extent: 350@420).
	origen := self innerBounds origin.
	
	botonBuscarCliente := BotonAccion new.
	self addMorph: botonBuscarCliente .
	botonBuscarCliente mouseAction: [ self buscarCliente ].	
	botonBuscarCliente position: (330@105).
	botonBuscarCliente label: 'Buscar cliente con DNI'.
	
	botonRegistrar := BotonAccion new.
	self addMorph: botonRegistrar .
	botonRegistrar mouseAction: [ self registrar ].	
	botonRegistrar position: (330@210).
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
	etiqueta color: Color black .
	
	campoDni := LabelWithTextFieldMorph new.
	self addMorph: campoDni.
	campoDni label: 'Dni:'.
	campoDni position: botonBuscarCliente position + (0@30).
	
	campoNombre := LabelWithTextFieldMorph new.
	self addMorph: campoNombre.
	campoNombre label: 'Nombre:'.
	campoNombre position: origen + (20@40).

	campoEspecie := LabelWithTextFieldMorph new.
	self addMorph: campoEspecie.
	campoEspecie label: 'Especie:'.
	campoEspecie position: campoNombre position + (0@60).

	campoRaza := LabelWithTextFieldMorph new.
	self addMorph: campoRaza.
	campoRaza label: 'Raza:'.
	campoRaza position: campoEspecie position + (0@60).
	
	campoFecha := LabelWithTextFieldMorph new.
	self addMorph: campoFecha.
	campoFecha label: 'Fecha de Nacimiento:'.
	campoFecha position: campoRaza position + (0@60).
	
	campoPeso := LabelWithTextFieldMorph new.
	self addMorph: campoPeso.
	campoPeso label: 'Peso:'.
	campoPeso position: campoFecha position + (0@60).
	
	campoId := LabelWithTextFieldMorph new.
	self addMorph: campoId.
	campoId label: 'Id:'.
	campoId position: campoPeso position + (0@60).
]

{ #category : 'propiosDelTipo' }
RegistrarMascotaVisual >> registrar [
	|mascota registrado|
	registrado := false.
	cliente 
	ifNil: 
		[ registrado := false. self informar: 'Cargar el cliente del cual desea registrar la mascota' ] 
	ifNotNil: [ 
		( self validarId and: [ self validarCampos ] ) ifFalse: [ registrado := false. self informar: 'Completar los datos de forma correcta.' ] 
		ifTrue: [  
			nombre := campoNombre contents.
			especie := campoEspecie contents.
			raza := campoRaza contents.
			fechaNacimiento := campoFecha contents.
			peso := campoPeso contents asNumber.
			id := campoId contents asNumber.
			mascota := Mascota crearConNombre: nombre conEspecie: especie conRaza: raza conFechaNacimiento: fechaNacimiento conPeso: peso conId: id.
			registrado := cliente agregarMascota: mascota.
			registrado ifTrue: [ self informar: 'La mascota se registro con exito.' ] ifFalse: [ self informar: 'La mascota ingresada ya se encuentra registrada en este cliente.' ].
		].
	]. 
^registrado 
]

{ #category : 'propiosDelTipo' }
RegistrarMascotaVisual >> validarCampos [
	|completos|
	completos := { campoNombre . campoEspecie . campoRaza . campoFecha . campoPeso } allSatisfy: [ :cadaCampo | cadaCampo contents isNotEmpty ] .
^completos 
]

{ #category : 'propiosDelTipo' }
RegistrarMascotaVisual >> validarId [
	| numero valido |
	valido := true.
	campoId contents isEmpty ifTrue: [
		self informar: 'Debe ingresar un Id.'.
		valido := false.
	].
	valido ifTrue: [ 
		id := campoId contents.
		(id allSatisfy: [ :c | c isDigit ]) ifFalse: [
		self informar: 'El Id debe contener únicamente números.'.
		valido := false.
		].
		valido ifTrue: [ 
			numero := id asNumber.
			((numero > 0) and: [ numero < 100000000 ]) ifFalse: [
			self informar: 'El Id debe tener entre 1 y 8 dígitos.'.
			valido := false
			].
		].
	].
	^valido
]

{ #category : 'accessing' }
RegistrarMascotaVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria 
]
