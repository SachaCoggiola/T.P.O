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

{ #category : 'creation' }
Medico class >> crearConNombre: unNombre conApellido: unApellido conNroDni: unNroDni conDomicilio: unDomicilio conFechaNacimiento: unaFecha conCuil: unCuil [ 
	|medico|
		medico := self new.
		medico inicializarConNroDoc: unNroDni conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conFechaNacimiento: unaFecha conCuil: unCuil.
		^medico. 
]

{ #category : 'propiosDelTipo' }
Medico >> equals: otroMedico [
^( otroMedico getNroDoc = nroDoc ).
]

{ #category : 'getters' }
Medico >> getNroDoc [
^nroDoc .
]

{ #category : 'initialization' }
Medico >> inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio conFechaNacimiento: unaFecha conCuil: unCuil [
	self inicializarConNroDoc: unNroDoc conNombre: unNombre conApellido: unApellido conDomicilio: unDomicilio.
	fechaNacimiento := unaFecha.
	cuil := unCuil.
	colMatriculas := OrderedCollection new.
]
