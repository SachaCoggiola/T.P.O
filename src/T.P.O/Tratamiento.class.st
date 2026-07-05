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
Tratamiento >> getDia [
	|dia|
		dia := fecha dayOfWeek.
		^dia.
]

{ #category : 'as yet unclassified' }
Tratamiento >> inicializarConFecha: unaFecha conMotivo: unMotivo conEstado: unEstado [
	fecha := unaFecha.
	motivo := unMotivo.
	estado := unEstado.
]

{ #category : 'as yet unclassified' }
Tratamiento >> inicializarConFechaTratamiento: unaFecha conMotivo: unMotivo conEstado: unEstado [
	fecha := unaFecha.
	motivo := unMotivo.
	estado := unEstado.
]

{ #category : 'as yet unclassified' }
Tratamiento >> obtenerDia [
 ^fecha dayOfWeek.
]

{ #category : 'as yet unclassified' }
Tratamiento >> verificarTratamiento: dia [
	^false.
]
