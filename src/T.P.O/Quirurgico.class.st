Class {
	#name : 'Quirurgico',
	#superclass : 'Tratamiento',
	#instVars : [
		'nombre',
		'nivelRiesgo',
		'tipoAnestesia'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
Quirurgico class >> crearConNombre: nombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo conEstado: unEstado [
	|quirurgico|
		quirurgico := self new.
		quirurgico inicializarConNombre: nombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo conEstado: unEstado.
		^quirurgico.
]

{ #category : 'as yet unclassified' }
Quirurgico >> inicializarConNombre: unNombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo conEstado: unEstado [
	self inicializarConFecha: unaFecha conMotivo: unMotivo conEstado: unMotivo.
	nombre := unNombre.
	nivelRiesgo := nivel.
	tipoAnestesia := anestesia.
]

{ #category : 'as yet unclassified' }
Quirurgico >> verificarTratamiento: diaValido [
	|esValido|
		esValido := diaValido and: [ (nivelRiesgo ~= 2) or: [ tipoAnestesia = 'general' ]].
		^esValido.
		
]
