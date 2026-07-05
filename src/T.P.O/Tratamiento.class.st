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
	|dia diaValido|
		dia := fecha getDia.
		diaValido := [ ]
		
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
