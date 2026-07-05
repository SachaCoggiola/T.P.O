Class {
	#name : 'Matricula',
	#superclass : 'Object',
	#instVars : [
		'numero',
		'colegioEmisor',
		'fechaInscripcion',
		'fechaVigencia',
		'tipo'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
Matricula class >> crearConNumero: unNro conColegioEmisor: unColegio conFechaInscripcion: unaFechaInsc conFechaVigencia: unaFechaVigen conTipo: unTipo [
	|matricula|
		matricula := self new.
		matricula inicializarConNumero: unNro conColegioEmisor: unColegio confechaInscripcion: unaFechaInsc conFechaVigencia: unaFechaVigen conTipo: unTipo.
		^matricula.
]

{ #category : 'as yet unclassified' }
Matricula >> inicializarConNumero: unNro conColegioEmisor: unColegio confechaInscripcion: unaFechaInsc conFechaVigencia: unaFechaVigen conTipo: unTipo [
	numero := unNro.
	colegioEmisor := unColegio.
	fechaInscripcion := unaFechaInsc.
	fechaVigencia := unaFechaVigen.
	tipo := unTipo.
]
