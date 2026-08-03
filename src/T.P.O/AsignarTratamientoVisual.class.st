Class {
	#name : 'AsignarTratamientoVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'diagnostico',
		'campoDiagnostico',
		'etiqueta',
		'botonCerrar',
		'botonFarmacologico',
		'botonQuirurgico',
		'botonBuscarDiagnostico',
		'veterinaria',
		'origen'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
AsignarTratamientoVisual >> buscarDiagnostico [
	|contenido|
	contenido := campoDiagnostico contents.
	contenido trimBoth isEmpty ifFalse: [
		(contenido allSatisfy: [ :c | c isDigit ]) ifFalse: [
			self informar: 'El id debe contener únicamente números.'.
		] ifTrue: [ 
			diagnostico := veterinaria buscarDiagnosticoConId: contenido asNumber.
			diagnostico ifNil: [ self informar: 'No se ha encontrado un diagnostico con el id ingresado' ] ifNotNil: [ self informar: 'Diagnostico encontrada' ] .
		].
	] ifTrue: [ self informar: 'Ingrese el id de un diagnostico' ]
]

{ #category : 'propiosDelTipo' }
AsignarTratamientoVisual >> cerrar [
	self delete.
]

{ #category : 'propiosDelTipo' }
AsignarTratamientoVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
AsignarTratamientoVisual >> initialize [ 
	super initialize.
	self color: (Color fromHexString: '024a86').
	self position: 45@45.
	self bounds: (45@45 extent: 350@420).
	origen := self innerBounds origin.
	
	botonFarmacologico := BotonAccion new.
	self addMorph: botonFarmacologico .
	botonFarmacologico mouseAction: [ self registrarFarmacologico ].	
	botonFarmacologico position: (20@210).
	botonFarmacologico label: 'Registrar tratamiento Farmacologico'.
	
	botonQuirurgico := BotonAccion new.
	self addMorph: botonQuirurgico .
	botonQuirurgico mouseAction: [ self registrarQuirurgico ].	
	botonQuirurgico position: (330@210).
	botonQuirurgico label: 'Registrar tratamiento Quirurgico'.
	
	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [ self cerrar ].
	botonCerrar position: (330@315).
	botonCerrar label: 'Cerrar'.
	
	etiqueta := LabelMorph new.
	self addMorph: etiqueta.
	etiqueta contents: 'Ingrese el Id del diagnostico al cual quiera cargar el tratamiento.'.
	etiqueta position: origen + (5@15).
	etiqueta color: Color black .
	
	campoDiagnostico := LabelWithTextFieldMorph new.
	self addMorph: campoDiagnostico.
	campoDiagnostico label: 'Id:'.
	campoDiagnostico position: origen + (20@40).
	
	botonBuscarDiagnostico := BotonAccion new.
	self addMorph: botonBuscarDiagnostico .
	botonBuscarDiagnostico mouseAction: [ self buscarDiagnostico ].	
	botonBuscarDiagnostico position: (330@105).
	botonBuscarDiagnostico label: 'Registrar'.
]

{ #category : 'propiosDelTipo' }
AsignarTratamientoVisual >> registrarFarmacologico [
	|ventana|
	diagnostico ifNil: [ self informar: 'Ingrese el diagnostico al cual quiera añadirle un tratamiento nuevo.' ] 
		ifNotNil: [ 
			ventana := RegistrarFarmacologicoVisual new.
			ventana veterinaria: veterinaria.
			ventana diagnostico: diagnostico.
			ventana openInWorld.
		]
]

{ #category : 'propiosDelTipo' }
AsignarTratamientoVisual >> registrarQuirurgico [
	|ventana|
	diagnostico ifNil: [ self informar: 'Ingrese el diagnostico al cual quiera añadirle un tratamiento nuevo.' ] 
		ifNotNil: [ 
			ventana := RegistrarQuirurgicoVisual new.
			ventana veterinaria: veterinaria.
			ventana diagnostico: diagnostico.
			ventana openInWorld.
		]
]

{ #category : 'accessing' }
AsignarTratamientoVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria 
]
