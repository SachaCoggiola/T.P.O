Class {
	#name : 'StockMedicamento',
	#superclass : 'Object',
	#instVars : [
		'id',
		'cantidad',
		'medicamento'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
StockMedicamento class >> crearConId: unId conCantidad: unaCantidad conMedicamento: unMedicamento [
	|stock|
		stock := self new.
		stock inicializarConId: unId conCantidad: unaCantidad conMedicamento: unMedicamento.
^stock.
]

{ #category : 'propiosDelTipo' }
StockMedicamento >> actualizarCantidad: unaCantidad [
	cantidad := cantidad + unaCantidad.
]

{ #category : 'getters' }
StockMedicamento >> getCantidad [
^cantidad.
]

{ #category : 'getters' }
StockMedicamento >> getId [
^id.
]

{ #category : 'getters' }
StockMedicamento >> getMedicamento [
^medicamento.
]

{ #category : 'initialization' }
StockMedicamento >> inicializarConId: unId conCantidad: unaCantidad conMedicamento: unMedicamento [
	id := unId.
	cantidad := unaCantidad.
	medicamento := unMedicamento.
]
