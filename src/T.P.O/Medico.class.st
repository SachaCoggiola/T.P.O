Class {
	#name : 'Medico',
	#superclass : 'Persona',
	#instVars : [
		'fechaNacimiento',
		'cuil',
		'colMatriculas'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
Medico class >> crearConNombre: unNombre conApellido: unApellido conNroDni: unNroDni conDomicilio: unDomicilio conFechaNacimiento: unaFecha conCuil: unCuil [ 
	|medico|
		medico := self new.
		medico inicializarConNroDoc: unNroDni conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conFechaNacimiento: unaFecha conCuil: unCuil.
		^medico. 
]

{ #category : 'as yet unclassified' }
Medico >> inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conFechaNacimiento: unaFecha conCuil: unCuil [
	self inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio.
	fechaNacimiento := unaFecha.
	cuil := unCuil.
	colMatriculas := OrderedCollection new.
]
