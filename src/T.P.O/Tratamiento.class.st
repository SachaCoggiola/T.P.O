Class {
	#name : 'Tratamiento',
	#superclass : 'Object',
	#instVars : [
		'fecha',
		'motivo',
		'estado'
	],
	#classInstVars : [
		'costoBase'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
Tratamiento >> esValido [
	|diaValido|
		diaValido := (self obtenerDia between: 2 and: 6).
		diaValido := self verificarTratamiento: diaValido.
		^diaValido.
		
		
]

{ #category : 'initialization' }
Tratamiento >> inicializarConFecha: unaFecha conMotivo: unMotivo [
	fecha := unaFecha.
	motivo := unMotivo.
	estado := 'pendiente'
]

{ #category : 'propiosDelTipo' }
Tratamiento >> obtenerDia [
 ^fecha dayOfWeek.
]

{ #category : 'setters' }
Tratamiento >> setEstado: unEstado [
[(unEstado = 'pendiente') or: [ (unEstado = 'realizado') or: (unEstado = 'cancelado') ]] ifTrue: [ estado := unEstado ].
]

{ #category : 'propiosDelTipo' }
Tratamiento >> verificarTratamiento: dia [
	^false.
]
