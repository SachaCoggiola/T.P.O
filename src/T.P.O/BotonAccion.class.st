Class {
	#name : 'BotonAccion',
	#superclass : 'SimpleButtonMorph',
	#instVars : [
		'mouseAction'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'initialization' }
BotonAccion >> initialize [ 
	super initialize.
	
	self color: Color black.
	self borderColor: Color black .
	self borderWidth: 1.
]

{ #category : 'accessing' }
BotonAccion >> label: unString [
	super label: unString.
	
	self submorphs ifNotEmpty: [ :sub | |text|
		text := sub first.
		text emphasis: 1.
		text color: Color white. 	
	].
]

{ #category : 'accessing' }
BotonAccion >> mouseAction: unBloque [
^mouseAction := unBloque
]

{ #category : 'event handling' }
BotonAccion >> mouseUp: unEvento [
	super mouseUp: unEvento.
	mouseAction value.
]

{ #category : 'instance creation' }
BotonAccion >> width: aWidth height: aHeight [
	self extent: (aWidth @ aHeight).
]
