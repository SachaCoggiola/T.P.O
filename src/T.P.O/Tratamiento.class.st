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

{ #category : 'as yet unclassified' }
Tratamiento >> esValido [
	|diaValido|
		diaValido := (self obtenerDia between: 2 and: 6).
		diaValido := self verificarTratamiento: diaValido.
		^diaValido.
		
		
]

{ #category : 'as yet unclassified' }
Tratamiento >> inicializarConFecha: unaFecha conMotivo: unMotivo [ 
	fecha := unaFecha.
	motivo := unMotivo.
	estado := 'pendiente'.
]

{ #category : 'as yet unclassified' }
Tratamiento >> obtenerDia [
 ^fecha dayOfWeek.
]

{ #category : 'initialization' }
Tratamiento >> setEstado: unEstado [
	[(unEstado = 'pendiente') or: [ (unEstado = 'realizado') or: (unEstado = 'cancelado') ]] ifTrue: [ estado := unEstado ].
]

{ #category : 'as yet unclassified' }
Tratamiento >> verificarTratamiento: dia [
	^false.
]
