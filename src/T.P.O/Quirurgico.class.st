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

{ #category : 'as yet unclassified' }
Quirurgico class >> crearConNombre: nombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo conEstado: unEstado conCostoBase: unCosto [
	|quirurgico|
		quirurgico := self new.
		quirurgico inicializarConNombre: nombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo conCostoBase: unCosto.
		^quirurgico.
]

{ #category : 'as yet unclassified' }
Quirurgico >> agregarNivelRiesgo: unNivel conAumento: unAumento [
	(unAumento > 0) ifTrue: [ aumentoRiesgo at: unNivel put: unAumento ].
]

{ #category : 'as yet unclassified' }
Quirurgico >> calcularMonto [
	|monto extra porcentaje|
		monto := super calcularMonto.
		extra := self obtenerMontoAnestesia.
		porcentaje := self obtenerValorAumentoRiesgo.
		^(monto +extra)*(porcentaje + 100)/100.
]

{ #category : 'as yet unclassified' }
Quirurgico >> cambiarAumento: unAumento deNivelRiesgo: unNivel [
	((unAumento > 0) and: [(unNivel <= aumentoRiesgo size) and: (unNivel >0)])ifTrue: [ aumentoRiesgo at: unNivel put: unAumento ].
]

{ #category : 'as yet unclassified' }
Quirurgico >> cambiarCosto: unCosto deTipoAnestesia: unTipoAnestesia [
	([unTipoAnestesia tipoAnestesiaValido: unTipoAnestesia] and: unCosto > 0) ifTrue: [ costoAnestesia at: unTipoAnestesia put: unCosto ]. 
]

{ #category : 'as yet unclassified' }
Quirurgico >> inicializarAumento [
	aumentoRiesgo := Dictionary new.
	aumentoRiesgo at: 1 put: 10 .
	aumentoRiesgo at: 2 put: 20 .
]

{ #category : 'as yet unclassified' }
Quirurgico >> inicializarConNombre: unNombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo conCostoBase: unCosto [
	self inicializarConFecha: unaFecha conMotivo: unMotivo conCostoBase: unCosto.
	nombre := unNombre.
	nivelRiesgo := nivel.
	tipoAnestesia := (self tipoAnestesiaValido:anestesia) ifTrue: [anestesia] ifFalse: ['Local'].
	self inicializarCostoTipoAnestesia.
	self inicializarAumento.
]

{ #category : 'as yet unclassified' }
Quirurgico >> inicializarCostoTipoAnestesia [
	costoAnestesia := Dictionary new.
	costoAnestesia at: 'Local' put: 30000.
	costoAnestesia at: 'Regional' put: 60000.
	costoAnestesia at: 'General' put: 100000.
]

{ #category : 'as yet unclassified' }
Quirurgico >> obtenerMontoAnestesia [
	^costoAnestesia at: tipoAnestesia.

]

{ #category : 'as yet unclassified' }
Quirurgico >> obtenerValorAumentoRiesgo [
	^aumentoRiesgo at: nivelRiesgo.
]

{ #category : 'as yet unclassified' }
Quirurgico >> tipoAnestesiaValido: unTipoAnestesia [
	^({'Regional'.'General'.'Local'} includes: unTipoAnestesia ).
]

{ #category : 'as yet unclassified' }
Quirurgico >> verificarTratamiento: diaValido [
	|esValido|
		esValido := diaValido and: [ (nivelRiesgo ~= 2) or: [ tipoAnestesia = 'general' ]].
		^esValido.
		
]
