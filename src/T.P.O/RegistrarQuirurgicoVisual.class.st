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
	self color: (Color fromHexString: '063F70').
	self position: 45@45.
	self bounds: (45@45 extent: 420@460).
	origen := self innerBounds origin.
	
	etiqueta := LabelMorph new.
	self addMorph: etiqueta.
	etiqueta contents: 'Ingrese los Datos.'.
	etiqueta position: origen + (10@15).
	etiqueta color: Color white.
	
	campoFecha := LabelWithTextFieldMorph new.
	self addMorph: campoFecha.
	campoFecha label: 'Fecha:'.
	campoFecha position: origen + (20@60).

	campoMotivo := LabelWithTextFieldMorph new.
	self addMorph: campoMotivo.
	campoMotivo label: 'Motivo:'.
	campoMotivo position: campoFecha position + (0@80).
	
	campoNombre := LabelWithTextFieldMorph new.
	self addMorph: campoNombre.
	campoNombre label: 'Nombre de la operación:'.
	campoNombre position: campoMotivo position + (0@80).

	Quirurgico inicializarTablas.	
	campoNivel := DropListMorph new.
	campoNivel list: Quirurgico aumentoRiesgo keys asOrderedCollection.
	campoNivel position: campoNombre position + (0@80).
	campoNivel extent: (150@25).
	self addMorph: campoNivel.
	
	campoTipo := DropListMorph new.
	campoTipo list: Quirurgico costoAnestesia keys asOrderedCollection.
	campoTipo position: campoNivel position + (0@60).
	campoTipo extent: (150@25).
	self addMorph: campoTipo.
	
	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [ self cerrar ].
	botonCerrar position: (310@(campoTipo position y + 30)).
	botonCerrar label: 'Cerrar'.
	
	botonRegistrar := BotonAccion new.
	self addMorph: botonRegistrar .
	botonRegistrar mouseAction: [ self registrar ].	
	botonRegistrar position: (310@(botonCerrar position y - 40)).
	botonRegistrar label: 'Registrar'.
		
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
			(self validarFecha) ifTrue: [
				( self validarCampos ) ifFalse: [ self informar: 'Completar los datos de forma correcta.' ] 
				ifTrue: [  
					motivo := campoMotivo contents.
					nombre := campoNombre contents.
					quirurgico := Quirurgico crearConNombre: nombre conNivelRiesgo: nivelRiesgo conTipoAnestesia: tipoAnestesia conFecha: fecha conMotivo: motivo.
					registrado := veterinaria registrarTratamiento: quirurgico conDiagnostico: diagnostico.
					registrado ifTrue: [ self informar: 'El tratamiento se registro con exito' ] ifFalse: [ self informar: 'El tratamiento ingresado no es valido, no se ha podido registrar el tratamiento.' ].
				].
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

{ #category : 'method' }
RegistrarQuirurgicoVisual >> validarFecha [
|esValido partesFecha fechaTexto |
    esValido := true.

  "Obtener el texto ingresado en el campo fechaInput"
    fechaTexto := campoFecha contents asString trimBoth.

  "Pasamos manualmente la fecha a int en formato DD MM YYYY"
    partesFecha := fechaTexto findTokens: ' '.
    fecha := [
        Date
            year: partesFecha third asInteger
            month: partesFecha second asInteger
            day: partesFecha first asInteger
    ] on: Error do: [
        self informar: 'Formato incorrecto. Use DD MM YYYY (ej: 01 08 2026)'.
        esValido := false
    ].

^esValido .
]

{ #category : 'accessing' }
RegistrarQuirurgicoVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria 
]
