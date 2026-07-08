Class {
	#name : 'Medicamento',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'precio',
		'esVentaLibre'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
Medicamento class >> crearConNombre: unNombre conPrecio: unPrecio conVentaLibre: esLibre [
	|medicamento|
		medicamento := self new.
		medicamento inicializarConNombre: unNombre conPrecio: unPrecio conVentaLibre: esLibre.
		^medicamento.
]

{ #category : 'getters' }
Medicamento >> getNombre [
^nombre.
]

{ #category : 'getters' }
Medicamento >> getPrecio [
^precio.
]

{ #category : 'getters' }
Medicamento >> getVentaLibre [
^esVentaLibre.
]

{ #category : 'initialization' }
Medicamento >> inicializarConNombre: unNombre conPrecio: unPrecio conVentaLibre: esLibre [
	nombre := unNombre.
	precio := unPrecio.
	esVentaLibre := esLibre.
]

{ #category : 'setters' }
Medicamento >> setPrecio: unPrecio [
	precio := unPrecio.
]

{ #category : 'setters' }
Medicamento >> setVentaLibre: esLibre [
	esVentaLibre := esLibre.
]
