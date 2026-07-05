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

{ #category : 'as yet unclassified' }
Medicamento >> getVentaLibre [
	^esVentaLibre.
]

{ #category : 'as yet unclassified' }
Medicamento >> inicializarConNombre: unNombre conPrecio: unPrecio conVentaLibre: esLibre [
	nombre := unNombre.
	precio := unPrecio.
	esVentaLibre := esLibre.
]
