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

{ #category : 'creation' }
Quirurgico class >> crearConNombre: nombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo [ 
	|quirurgico|
		quirurgico := self new.
		quirurgico inicializarConNombre: nombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo .
		^quirurgico.
]

{ #category : 'initialization' }
Quirurgico >> inicializarConNombre: unNombre conNivelRiesgo: nivel conTipoAnestesia: anestesia conFecha: unaFecha conMotivo: unMotivo [
	self inicializarConFecha: unaFecha conMotivo: unMotivo. "-> También inicializa estado"
	nombre := unNombre.
	nivelRiesgo := nivel.
	tipoAnestesia := anestesia.
]

{ #category : 'propiosDelTipo' }
Quirurgico >> verificarTratamiento: diaValido [
	|esValido|
		esValido := (diaValido and: [ (nivelRiesgo ~= 2) or: [ tipoAnestesia = 'general' ]]).
		^esValido.
		  
]
