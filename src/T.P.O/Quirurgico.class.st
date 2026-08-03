Class {
	#name : 'Quirurgico',
	#superclass : 'Tratamiento',
	#instVars : [
		'nombre',
		'nivelRiesgo',
		'tipoAnestesia'
	],
	#classInstVars : [
		'costoAnestesia',
		'aumentoRiesgo'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
Quirurgico class >> agregarNivelRiesgoConAumento: unAumento [
	aumentoRiesgo at: (aumentoRiesgo size + 1) put: unAumento.
]

{ #category : 'accessing' }
Quirurgico class >> aumentoRiesgo [
^aumentoRiesgo 
]

{ #category : 'propiosDelTipo' }
Quirurgico class >> cambiarAumento: unAumento deNivelRiesgo: unNivel [
	( (unAumento > 0) and: [ (unNivel <= aumentoRiesgo size) and: (unNivel >0) ] ) ifTrue: [ aumentoRiesgo at: unNivel put: unAumento ].
]

{ #category : 'propiosDelTipo' }
Quirurgico class >> cambiarCosto: unCosto deTipoAnestesia: unTipoAnestesia [
	( [ unTipoAnestesia tipoAnestesiaValido: unTipoAnestesia ] and: unCosto > 0 ) ifTrue: [ costoAnestesia at: unTipoAnestesia put: unCosto ]. 
]

{ #category : 'accessing' }
Quirurgico class >> costoAnestesia [
^costoAnestesia 
]

{ #category : 'creation' }
Quirurgico class >> crearConNombre: nombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo [ 
	|quirurgico|
		self inicializarTablas.
		quirurgico := self new.
		quirurgico inicializarConNombre: nombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo .
		^quirurgico.
]

{ #category : 'initialization' }
Quirurgico class >> inicializarTablas [
 	aumentoRiesgo ifNil: [ 	
		aumentoRiesgo := Dictionary new.
		aumentoRiesgo at: 1 put: 10 .
		aumentoRiesgo at: 2 put: 20 . 
	].
	costoAnestesia ifNil: [ 
		costoAnestesia := Dictionary new.
		costoAnestesia at: 'Local' put: 30000.
		costoAnestesia at: 'Regional' put: 60000.
		costoAnestesia at: 'General' put: 100000.
	].
]

{ #category : 'getters' }
Quirurgico class >> obtenerMontoAnestesia: tipoAnestesia [
	|monto|
	monto := 0.
	costoAnestesia at: tipoAnestesia ifPresent: [ :valor | monto := valor ].
^monto 
]

{ #category : 'getters' }
Quirurgico class >> obtenerValorAumentoRiesgo: nivelRiesgo [
	|aumento|
	aumento := 0.
	aumentoRiesgo at: nivelRiesgo ifPresent: [ :porcentaje | aumento := porcentaje ].
	^aumento
]

{ #category : 'propiosDelTipo' }
Quirurgico >> calcularMonto [
	|monto extra porcentaje|
		monto := super calcularMonto.
		extra := self class obtenerMontoAnestesia: tipoAnestesia .
		porcentaje := self class obtenerValorAumentoRiesgo: nivelRiesgo .
		^(monto +extra)*(porcentaje + 100)/100.
]

{ #category : 'getters' }
Quirurgico >> getNivelRiesgo [
^nivelRiesgo.
]

{ #category : 'getters' }
Quirurgico >> getNombre [
^nombre.
]

{ #category : 'getters' }
Quirurgico >> getTipoAnestesia [
^tipoAnestesia.
]

{ #category : 'initialization' }
Quirurgico >> inicializarConNombre: unNombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo [
	self inicializarConFecha: unaFecha conMotivo: unMotivo.
	nombre := unNombre.
	nivelRiesgo := nivel.
	tipoAnestesia := ( self tipoAnestesiaValido:anestesia ) ifTrue: [anestesia] ifFalse: [ 'Local' ].
]

{ #category : 'propiosDelTipo' }
Quirurgico >> tipoAnestesiaValido: unTipoAnestesia [
^( {'Regional'.'General'.'Local'} includes: unTipoAnestesia ).
]

{ #category : 'propiosDelTipo' }
Quirurgico >> verificarTratamiento: diaValido [
	|esValido|
		esValido := ( diaValido and: [ ( nivelRiesgo ~= 2 ) or: [ tipoAnestesia = 'general' ] ] ).
^esValido.
		  
]
