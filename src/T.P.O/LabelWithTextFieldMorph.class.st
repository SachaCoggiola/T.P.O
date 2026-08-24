Class {
	#name : 'LabelWithTextFieldMorph',
	#superclass : 'BorderedMorph',
	#instVars : [
		'label',
		'campoTexto'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'accessing' }
LabelWithTextFieldMorph class >> label: unTexto [
	|etiqueta|
	etiqueta := self new.
	etiqueta label: unTexto.
	^etiqueta 
]

{ #category : 'accessing' }
LabelWithTextFieldMorph >> contents [
^campoTexto text asString.
]

{ #category : 'initialization' }
LabelWithTextFieldMorph >> initialize [
	|posicion|
	super initialize.
	self color: (Color fromHexString: '662806') .
	self bounds: (0@0 extent: 200@60).
	self borderWidth: 2.
	self borderColor: Color black.
	
	label := TextMorph new.
	label contents: ''.
	label color: Color white.
	posicion := self innerBounds origin.
	label position: posicion + (5@0).
	label fit.
	self addMorph: label.
	
	campoTexto := RubTextFieldMorph new.
	campoTexto borderColor: Color white.
	campoTexto borderWidth: 1.
	campoTexto position: label position + (0@20).
	campoTexto extent: self width - (40@40). 
	self addMorph: campoTexto.
]

{ #category : 'accessing' }
LabelWithTextFieldMorph >> label: unTexto [
	label contents: unTexto
]

{ #category : 'accessing' }
LabelWithTextFieldMorph >> text [
^campoTexto text asString
]
