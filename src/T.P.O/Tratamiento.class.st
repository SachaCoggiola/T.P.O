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
	|dia diaValido|
		dia := fecha getDia.
		diaValido := [ ]
		
]

{ #category : 'as yet unclassified' }
Tratamiento >> getDia [
	|dia|
		dia := fecha dayOfWeek.
		^dia.
]

{ #category : 'initialization' }
Tratamiento >> inicializarConFecha: unaFecha conMotivo: unMotivo conEstado: unEstado [
	fecha := unaFecha.
	motivo := unMotivo.
	estado := unEstado.
]

{ #category : 'initialization' }
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
