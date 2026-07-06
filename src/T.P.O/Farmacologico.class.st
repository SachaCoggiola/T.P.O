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

{ #category : 'creation' }
Farmacologico class >> crearConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo conEstado: unEstado [
	|farmacologico|
		farmacologico := self new.
		farmacologico inicializarConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo conEstado: unEstado.
		^farmacologico.
]

{ #category : 'initialization' }
Farmacologico >> inicializarConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo conEstado: unEstado [
	self inicializarConFecha: unaFecha conMotivo: unMotivo conEstado: unEstado.
	medicamento := unMedicamento.
	dosis := unaDosis.
	frecuencia := unaFrecuencia. 
]
