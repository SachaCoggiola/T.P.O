Class {
	#name : 'RegistrarQuirurgicoVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'diagnostico'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
RegistrarQuirurgicoVisual >> cerrar [ 
	self delete
]

{ #category : 'accessing' }
RegistrarQuirurgicoVisual >> diagnostico: unDiagnostico [
^diagnostico := unDiagnostico
]
