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
Medico class >> crearConNombre: unNombre conApellido: unApellido conNroDni: unNroDni conDomicilio: unDomicilio conFechaNacimiento: unaFecha conCuil: unCuil conMatricula: unaMatricula [
	|medico|
		medico := self new.
		medico inicializarConNroDoc: unNroDni conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conFechaNacimiento: unaFecha conCuil: unCuil conMatricula: unaMatricula.
		^medico. 
]

{ #category : 'as yet unclassified' }
Medico >> inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conFechaNacimiento: unaFecha conCuil: unCuil conMatricula: unaMatricula [
	self inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio.
	fechaNacimiento := unaFecha.
	cuil := unCuil.
	colMatriculas := OrderedCollection new.
	colMatriculas add: unaMatricula.
]
