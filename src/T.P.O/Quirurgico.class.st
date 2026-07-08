Class {
	#name : 'Quirurgico',
	#superclass : 'Tratamiento',
	#instVars : [
		'nombre',
		'nivelRiesgo',
		'tipoAnestesia'
	],
	#classVars : [
		'aumentoRiesgo',
		'costoAnestesia'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
Quirurgico class >> crearConNombre: nombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo [ 
	|quirurgico|
		quirurgico := self new.
		quirurgico inicializarConNombre: nombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo .
		^quirurgico.
]

{ #category : 'propiosDelTipo' }
Quirurgico >> agregarNivelRiesgo: unNivel conAumento: unAumento [
	( (unAumento > 0) and: (unNivel = ( aumentoRiesgo size + 1 ) ) ) ifTrue: [ aumentoRiesgo at: unNivel put: unAumento ].
]

{ #category : 'propiosDelTipo' }
Quirurgico >> calcularMonto [
	|monto extra porcentaje|
		monto := super calcularMonto.
		extra := self obtenerMontoAnestesia.
		porcentaje := self obtenerValorAumentoRiesgo.
		^(monto +extra)*(porcentaje + 100)/100.
]

{ #category : 'propiosDelTipo' }
Quirurgico >> cambiarAumento: unAumento deNivelRiesgo: unNivel [
	( (unAumento > 0) and: [ (unNivel <= aumentoRiesgo size) and: (unNivel >0) ] ) ifTrue: [ aumentoRiesgo at: unNivel put: unAumento ].
]

{ #category : 'propiosDelTipo' }
Quirurgico >> cambiarCosto: unCosto deTipoAnestesia: unTipoAnestesia [
	( [ unTipoAnestesia tipoAnestesiaValido: unTipoAnestesia ] and: unCosto > 0 ) ifTrue: [ costoAnestesia at: unTipoAnestesia put: unCosto ]. 
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
Quirurgico >> inicializarAumento [
	aumentoRiesgo ifNil: [ 	
		aumentoRiesgo := Dictionary new.
		aumentoRiesgo at: 1 put: 10 .
		aumentoRiesgo at: 2 put: 20 . 
	].
]

{ #category : 'initialization' }
Quirurgico >> inicializarConNombre: unNombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo [
	self inicializarConFecha: unaFecha conMotivo: unMotivo.
	nombre := unNombre.
	nivelRiesgo := nivel.
	tipoAnestesia := ( self tipoAnestesiaValido:anestesia ) ifTrue: [anestesia] ifFalse: [ 'Local' ].
	self inicializarCostoTipoAnestesia.
	self inicializarAumento.
]

{ #category : 'initialization' }
Quirurgico >> inicializarCostoTipoAnestesia [
	costoAnestesia ifNil: [ 
		costoAnestesia := Dictionary new.
		costoAnestesia at: 'Local' put: 30000.
		costoAnestesia at: 'Regional' put: 60000.
		costoAnestesia at: 'General' put: 100000.
	].
]

{ #category : 'getters' }
Quirurgico >> obtenerMontoAnestesia [
^costoAnestesia at: tipoAnestesia.

]

{ #category : 'getters' }
Quirurgico >> obtenerValorAumentoRiesgo [
^aumentoRiesgo at: nivelRiesgo.
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
