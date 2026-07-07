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
Farmacologico class >> crearConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo conEstado: unEstado conCostoBase: unCosto [
	|farmacologico|
		farmacologico := self new.
		farmacologico inicializarConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo conCostoBase: unCosto.
		^farmacologico.
]

{ #category : 'as yet unclassified' }
Farmacologico >> calcularMonto [
	|monto valorMedicina|
		monto := super calcularMonto.
		valorMedicina := medicamento obtenerValorMedicamento.
		monto := monto + valorMedicina.
		(monto > 40000) ifTrue: [ monto := monto*90/100].
		^monto. 
		
]

{ #category : 'as yet unclassified' }
Farmacologico >> inicializarConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo conCostoBase: unCosto [
	self inicializarConFecha: unaFecha conMotivo: unMotivo conCostoBase: unCosto .
	medicamento := unMedicamento.
	dosis := unaDosis.
	frecuencia := unaFrecuencia. 
]

{ #category : 'as yet unclassified' }
Farmacologico >> obtenerValorMedicamento [
	^ medicamento getPrecio * dosis.
]

{ #category : 'as yet unclassified' }
Farmacologico >> verificarTratamiento: diaValido [
	|esValido|
		esValido := (diaValido) or: [ medicamento getVentaLibre ].
		^esValido.
	
]
