Class {
	#name : 'RegistrarFarmacologicoVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'diagnostico'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
RegistrarFarmacologicoVisual >> cerrar [
	self delete
]

{ #category : 'accessing' }
RegistrarFarmacologicoVisual >> diagnostico: unDiagnostico [
^diagnostico := unDiagnostico 
]
