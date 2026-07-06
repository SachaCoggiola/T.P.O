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

{ #category : 'creation' }
Medicamento class >> crearConNombre: unNombre conPrecio: unPrecio conVentaLibre: esLibre [
	|medicamento|
		medicamento := self new.
		medicamento inicializarConNombre: unNombre conPrecio: unPrecio conVentaLibre: esLibre.
		^medicamento.
]

{ #category : 'initialization' }
Medicamento >> inicializarConNombre: unNombre conPrecio: unPrecio conVentaLibre: esLibre [
	nombre := unNombre.
	precio := unPrecio.
	esVentaLibre := esLibre.
]
