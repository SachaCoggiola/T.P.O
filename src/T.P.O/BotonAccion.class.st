Class {
	#name : 'BotonAccion',
	#superclass : 'SimpleButtonMorph',
	#instVars : [
		'mouseAction',
		'contenedor'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'accessing' }
BotonAccion >> mouseAction: unBloque [
^mouseAction := unBloque
]

{ #category : 'event handling' }
BotonAccion >> mouseUp: unEvento [
	mouseAction value.
]
