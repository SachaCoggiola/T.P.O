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
Farmacologico class >> crearConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo [
	|farmacologico|
		farmacologico := self new.
		farmacologico inicializarConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo.
		^farmacologico.
]

{ #category : 'propiosDelTipo' }
Farmacologico >> calcularMonto [
	|monto valorMedicina|
		monto := super calcularMonto.
		valorMedicina := medicamento obtenerValorMedicamento.
		monto := monto + valorMedicina.
		( monto > 40000 ) ifTrue: [ monto := monto*90/100 ].
^monto. 
		
]

{ #category : 'getters' }
Farmacologico >> getDosis [
^dosis
]

{ #category : 'getters' }
Farmacologico >> getFrecuencia [
^frecuencia.
]

{ #category : 'getters' }
Farmacologico >> getMedicamento [
^medicamento.
]

{ #category : 'initialization' }
Farmacologico >> inicializarConMedicamento: unMedicamento conDosis: unaDosis conFrecuencia: unaFrecuencia conFecha: unaFecha conMotivo: unMotivo [
	self inicializarConFecha: unaFecha conMotivo: unMotivo. "-> También inicializa estado"
	medicamento := unMedicamento.
	dosis := unaDosis.
	frecuencia := unaFrecuencia. 
	
]

{ #category : 'propiosDelTipo' }
Farmacologico >> obtenerValorMedicamento [
^medicamento getPrecio * dosis.
]

{ #category : 'propiosDelTipo' }
Farmacologico >> verificarTratamiento: diaValido [
	|esValido|
		esValido := ( diaValido ) or: [ medicamento getVentaLibre ].
^esValido.
	
]
