Class {
	#name : 'RegistrarQuirurgicoVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'diagnostico',
		'fecha',
		'motivo',
		'nombre',
		'nivelRiesgo',
		'tipoAnestesia',
		'campoFecha',
		'campoMotivo',
		'campoNombre',
		'campoNivel',
		'campoTipo',
		'etiqueta',
		'botonCerrar',
		'botonRegistrar',
		'origen'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
RegistrarQuirurgicoVisual >> cerrar [ 
	self delete
]

{ #category : 'accessing' }
RegistrarQuirurgicoVisual >> diagnostico: unDiagnostico [
^diagnostico := unDiagnostico
]

{ #category : 'propiosDelTipo' }
RegistrarQuirurgicoVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
RegistrarQuirurgicoVisual >> initialize [
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
	
	campoFecha := LabelWithTextFieldMorph new.
	self addMorph: campoFecha.
	campoFecha label: 'Fecha:'.
	campoFecha position: origen + (20@40).

	campoMotivo := LabelWithTextFieldMorph new.
	self addMorph: campoMotivo.
	campoMotivo label: 'Motivo:'.
	campoMotivo position: campoFecha position + (0@60).
	
	campoNombre := LabelWithTextFieldMorph new.
	self addMorph: campoNombre.
	campoNombre label: 'Nombre de la operación:'.
	campoNombre position: campoMotivo position + (0@60).

	Quirurgico inicializarTablas.	
	campoNivel := DropListMorph new.
	campoNivel list: Quirurgico aumentoRiesgo keys asOrderedCollection.
	campoNivel position: (20@20).
	campoNivel extent: (150@25).
	self addMorph: campoNivel.
	
	campoTipo := DropListMorph new.
	campoTipo list: Quirurgico costoAnestesia keys asOrderedCollection.
	campoTipo position: (60@20).
	campoTipo extent: (150@25).
	self addMorph: campoTipo.
]

{ #category : 'propiosDelTipo' }
RegistrarQuirurgicoVisual >> registrar [
	|quirurgico registrado|
	registrado := false.
	tipoAnestesia := campoTipo selectedItem.
	nivelRiesgo := campoNivel selectedItem.
	tipoAnestesia 
	ifNil: 
		[ self informar: 'Elegir el tipo de anestesia del tratamiento quirurgico a registrar' ] 
	ifNotNil: [
		nivelRiesgo 
		ifNil: 
			[ self informar: 'Elegir el nivel de riesgo del tratamiento quirurgico a registrar' ]
		ifNotNil: [
			( self validarCampos ) ifFalse: [ registrado := false. self informar: 'Completar los datos de forma correcta.' ] 
			ifTrue: [  
				fecha := campoFecha contents.
				motivo := campoMotivo contents.
				nombre := campoNombre contents.
				quirurgico := Quirurgico crearConNombre: nombre conNivelRiesgo: nivelRiesgo conTipoAnestesia: tipoAnestesia conFecha: fecha conMotivo: motivo.
				registrado := veterinaria registrarTratamiento: quirurgico conDiagnostico: diagnostico.
				registrado ifTrue: [ self informar: 'El tratamiento se registro con exito' ] ifFalse: [ self informar: 'El tratamiento ingresado no es valido, no se ha podido registrar el tratamiento.' ].
			].
		].
	]. 
^registrado
]

{ #category : 'propiosDelTipo' }
RegistrarQuirurgicoVisual >> validarCampos [
	|completos|
	completos := { campoFecha . campoMotivo . campoNombre } allSatisfy: [ :cadaCampo | cadaCampo contents isNotEmpty ] .
^completos
]

{ #category : 'accessing' }
RegistrarQuirurgicoVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria 
]
