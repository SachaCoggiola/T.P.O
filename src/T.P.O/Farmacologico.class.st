Class {
	#name : 'Farmacologico',
	#superclass : 'Tratamiento',
	#instVars : [
		'medicamento',
		'dosis',
		'frecuencia'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
Farmacologico class >> crearConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo conEstado: unEstado [
	|farmacologico|
		farmacologico := self new.
		farmacologico inicializarConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo.
		^farmacologico.
]

{ #category : 'as yet unclassified' }
Farmacologico >> inicializarConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo [
	self inicializarConFecha: unaFecha conMotivo: unMotivo.
	medicamento := unMedicamento.
	dosis := unaDosis.
	frecuencia := unaFrecuencia. 
]

{ #category : 'initialization' }
Farmacologico >> setEstado: unEstado [
	super setEstado: unEstado.
]

{ #category : 'as yet unclassified' }
Farmacologico >> verificarTratamiento: diaValido [
	|esValido|
		esValido := (diaValido) or: [ medicamento getVentaLibre ].
		^esValido.
	
]
