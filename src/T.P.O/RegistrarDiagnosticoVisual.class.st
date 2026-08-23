Class {
	#name : 'RegistrarDiagnosticoVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'fecha',
		'descripcion',
		'medico',
		'mascota',
		'id',
		'campoFecha',
		'campoDescripcion',
		'campoMedico',
		'campoMascota',
		'campoId',
		'etiqueta',
		'botonBuscarMedico',
		'botonBuscarMascota',
		'botonCerrar',
		'botonRegistrar',
		'origen'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
RegistrarDiagnosticoVisual >> buscarMascota [
	|contenido|
	contenido := campoMascota contents.
	contenido trimBoth isEmpty ifFalse: [
		(contenido allSatisfy: [ :c | c isDigit ]) ifFalse: [
			self informar: 'El id debe contener únicamente números.'.
		] ifTrue: [
			mascota := veterinaria buscarMascotaConId: contenido asNumber.
			mascota ifNil: [ self informar: 'No se ha encontrado una mascota con el id ingresado' ] ifNotNil: [ self informar: 'Mascota encontrada' ] .
		].
	] ifTrue: [ self informar: 'Ingrese el id de una mascota' ]
]

{ #category : 'propiosDelTipo' }
RegistrarDiagnosticoVisual >> buscarMedico [
	|contenido|
	contenido := campoMedico contents. 
	( contenido trimBoth isEmpty ) ifFalse: [
		(contenido allSatisfy: [ :c | c isDigit ]) ifFalse: [
			self informar: 'El DNI debe contener únicamente números.'.
		] ifTrue: [
			medico := veterinaria buscarMedicoConDni: contenido asNumber.
			medico ifNil: [ self informar: 'No se ha encontrado un medico con el DNI ingresado' ] ifNotNil: [ self informar: 'Medico encontrado' ] .
		].
	] ifTrue: [ self informar: 'Ingrese el DNI de un medico' ]
]

{ #category : 'propiosDelTipo' }
RegistrarDiagnosticoVisual >> cerrar [
self delete
]

{ #category : 'propiosDelTipo' }
RegistrarDiagnosticoVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
RegistrarDiagnosticoVisual >> initialize [
	super initialize.
	self color: (Color fromHexString: '063F70').
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
	etiqueta color: Color white .
	
	campoFecha := LabelWithTextFieldMorph new.
	self addMorph: campoFecha.
	campoFecha label: 'Fecha:'.
	campoFecha position: origen + (20@40).

	campoDescripcion := LabelWithTextFieldMorph new.
	self addMorph: campoDescripcion.
	campoDescripcion label: 'Descripcion:'.
	campoDescripcion position: campoFecha position + (0@60).
	
	campoMedico := LabelWithTextFieldMorph new.
	self addMorph: campoMedico.
	campoMedico label: 'Dni de medico:'.
	campoMedico position: campoDescripcion position + (0@60).
	
	campoMascota := LabelWithTextFieldMorph new.
	self addMorph: campoMascota.
	campoMascota label: 'Id de mascota:'.
	campoMascota position: campoMedico position + (0@60).
	
	campoId := LabelWithTextFieldMorph new.
	self addMorph: campoId.
	campoId label: 'Id:'.
	campoId position: campoMascota position + (0@60).
	
	botonBuscarMedico := BotonAccion new.
	self addMorph: botonBuscarMedico.
	botonBuscarMedico mouseAction: [ self buscarMedico ].
	botonBuscarMedico position: (280@220).
	botonBuscarMedico label: 'Buscar medico'.
	
	botonBuscarMascota := BotonAccion new.
	self addMorph: botonBuscarMascota.
	botonBuscarMascota mouseAction: [ self buscarMascota ].
	botonBuscarMascota position: (280@280).
	botonBuscarMascota label: 'Buscar mascota'.
]

{ #category : 'propiosDelTipo' }
RegistrarDiagnosticoVisual >> registrar [
	|diagnostico registrado|
	registrado := false.
	mascota 
	ifNil: [ self informar: 'Buscar la mascota de la cual desea registrar el diagnostico' ]
	ifNotNil: [
		medico 
		ifNil: [ self informar: 'Buscar el medico que realiza el tratamiento' ]
		ifNotNil: [  
			( self validarId and: [ self validarCampos ] ) ifFalse: [ registrado := false. self informar: 'Completar los datos de forma correcta.' ] 
			ifTrue: [
				id := campoId contents asNumber.
				fecha := campoFecha contents .
				descripcion := campoDescripcion contents.
				diagnostico := Diagnostico crearConFecha: fecha conDescripcion: descripcion conMedico: medico conMascota: mascota conId: id.
				registrado := veterinaria agregarDiagnostico: diagnostico .
				registrado ifTrue: [ self informar: 'El diagnostico se registro con exito.' ] ifFalse: [ self informar: 'El diagnostico ingresado ya se encuentra registrado.' ].
			].
		].
	].
^registrado 
]

{ #category : 'propiosDelTipo' }
RegistrarDiagnosticoVisual >> validarCampos [
	|completos|
	completos := { campoFecha . campoDescripcion . campoMedico . campoMascota } allSatisfy: [ :cadaCampo | cadaCampo contents isNotEmpty ] .
^completos 
]

{ #category : 'propiosDelTipo' }
RegistrarDiagnosticoVisual >> validarId [
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
RegistrarDiagnosticoVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria 
]
