Class {
	#name : 'RegistrarFarmacologicoVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'diagnostico',
		'fecha',
		'motivo',
		'medicamento',
		'dosis',
		'frecuencia',
		'campoFecha',
		'campoMotivo',
		'campoMedicamento',
		'campoDosis',
		'campoFrecuencia',
		'etiqueta',
		'botonBuscarMedicamento',
		'botonCerrar',
		'botonRegistrar',
		'origen',
		'fechaObjeto'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
RegistrarFarmacologicoVisual >> buscarMedicamento [
	|contenido|
	contenido := campoMedicamento contents.
	( contenido asString trimBoth isEmpty ) ifFalse: [
		medicamento := veterinaria buscarMedicamento: contenido.
		medicamento ifNil: [ self informar: 'No se ha encontrado un medicamento con el nombre ingresado' ] 
		ifNotNil: [ self informar: 'Medicamento encontrado' ] .
	] 
	ifTrue: [ 
		self informar: 'Ingrese el nombre de un medicamento' 
	]
]

{ #category : 'propiosDelTipo' }
RegistrarFarmacologicoVisual >> cerrar [
	self delete
]

{ #category : 'accessing' }
RegistrarFarmacologicoVisual >> diagnostico: unDiagnostico [
^diagnostico := unDiagnostico 
]

{ #category : 'propiosDelTipo' }
RegistrarFarmacologicoVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
RegistrarFarmacologicoVisual >> initialize [
	super initialize.
	self color: (Color fromHexString: '063F70').
	self position: 45@45.
	self bounds: (45@45 extent: 440@480).
	origen := self innerBounds origin.
		
	etiqueta := LabelMorph new.
	self addMorph: etiqueta.
	etiqueta contents: 'Ingrese los Datos.'.
	etiqueta position: origen + (10@15).
	etiqueta color: Color white .
	
	campoFecha := LabelWithTextFieldMorph new.
	self addMorph: campoFecha.
	campoFecha label: 'Fecha:'.
	campoFecha position: origen + (20@60).

	campoMotivo := LabelWithTextFieldMorph new.
	self addMorph: campoMotivo.
	campoMotivo label: 'Motivo:'.
	campoMotivo position: campoFecha position + (0@80).
	
	campoMedicamento := LabelWithTextFieldMorph new.
	self addMorph: campoMedicamento.
	campoMedicamento label: 'Nombre de medicamento:'.
	campoMedicamento position: campoMotivo position + (0@80).
	
	campoDosis := LabelWithTextFieldMorph new.
	self addMorph: campoDosis.
	campoDosis label: 'Dosis:'.
	campoDosis position: campoMedicamento position + (0@80).

	campoFrecuencia := LabelWithTextFieldMorph new.
	self addMorph: campoFrecuencia.
	campoFrecuencia label: 'Frecuencia:'.
	campoFrecuencia position: campoDosis position + (0@80).
	
	botonBuscarMedicamento := BotonAccion new.
	self addMorph: botonBuscarMedicamento.
	botonBuscarMedicamento mouseAction: [ self buscarMedicamento ].
	botonBuscarMedicamento position: (280@(campoMedicamento position y + 10)).
	botonBuscarMedicamento label: 'Buscar medicamento'.
	
  botonRegistrar := BotonAccion new.
	self addMorph: botonRegistrar .
	botonRegistrar mouseAction: [ self registrar ].	
	botonRegistrar position: (310@(campoFecha position y + 10)).
	botonRegistrar label: 'Registrar'.
	
	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [ self cerrar ].
	botonCerrar position: (310@(campoFrecuencia position y + 30)).
	botonCerrar label: 'Cerrar'.
]

{ #category : 'propiosDelTipo' }
RegistrarFarmacologicoVisual >> registrar [
	|tratamiento registrado|
	registrado := false.
	medicamento 
	ifNil: 
		[ registrado := false. self informar: 'Cargar el medicamento del tratamiento' ] 
	ifNotNil: [ 
		( self validarCampos ) ifFalse: [ registrado := false. self informar: 'Completar los datos de forma correcta.' ] 
		ifTrue: [  
			(self validarFecha) ifTrue: [  
			motivo := campoMotivo contents.
			dosis := campoDosis contents asNumber.
			frecuencia := campoFrecuencia contents asNumber.
			tratamiento := Farmacologico crearConMedicamento: medicamento conDosis: dosis conFrecuencia: frecuencia conFecha: fecha conMotivo: motivo .
			registrado := veterinaria registrarTratamiento: tratamiento conDiagnostico: diagnostico.
			].
			registrado ifTrue: [ self informar: 'El tratamiento se registro con exito.' ] ifFalse: [ self informar: 'El tratamiento ingresado no es valido, no se ha podido registrar el tratamiento.' ].
		].
	]. 
^registrado
]

{ #category : 'propiosDelTipo' }
RegistrarFarmacologicoVisual >> validarCampos [
	|completos|
	completos := { campoFecha . campoMotivo . campoDosis . campoFrecuencia } allSatisfy: [ :cadaCampo | cadaCampo contents isNotEmpty ] .
^completos
]

{ #category : 'propiosDelTipo' }
RegistrarFarmacologicoVisual >> validarFecha [
|esValido partesFecha fechaTexto |
    esValido := true.

    fechaTexto := campoFecha contents asString trimBoth.

    ((fechaTexto includesSubstring: ' ') and: (fechaTexto isNotEmpty)) ifTrue: [  
  "Pasamos manualmente la fecha a int en formato DD MM YYYY"
    partesFecha := fechaTexto findTokens: ' '.
    fecha := [
        Date
            year: partesFecha third asInteger
            month: partesFecha second asInteger
            day: partesFecha first asInteger
    ] on: Error do: [
        self informar: 'Formato incorrecto en fecha. Use DD MM YYYY (ej: 01 08 2026)'.
        esValido := false
    ].
] ifFalse: [ esValido := false.
self informar: 'Formato incorrecto en fecha. Use DD MM YYYY (ej: 01 08 2026)'.
 ].

^esValido .
]

{ #category : 'accessing' }
RegistrarFarmacologicoVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria 
]
