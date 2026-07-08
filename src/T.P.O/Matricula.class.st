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

{ #category : 'getters' }
Matricula >> getColegioEmisor [
^colegioEmisor.
]

{ #category : 'getters' }
Matricula >> getFechaInscripcion [
^fechaInscripcion.
]

{ #category : 'getters' }
Matricula >> getFechaVigencia [
^fechaVigencia.
]

{ #category : 'getters' }
Matricula >> getNumero [
^numero.
]

{ #category : 'getters' }
Matricula >> getTipoMatricula [
^tipo.
]

{ #category : 'initialization' }
Matricula >> inicializarConNumero: unNro conColegioEmisor: unColegio confechaInscripcion: unaFechaInsc conFechaVigencia: unaFechaVigen conTipo: unTipo [
	numero := unNro.
	colegioEmisor := unColegio.
	fechaInscripcion := unaFechaInsc.
	fechaVigencia := unaFechaVigen.
	tipo := unTipo.
]
