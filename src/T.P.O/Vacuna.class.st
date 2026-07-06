Class {
	#name : 'Vacuna',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'laboratorio',
		'especie',
		'mesesVigencia'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'initialization' }
Vacuna >> inicializarConNombre: unNombre yLab: unLaboratorio yEspecie: unaEspecie yMesesDeVigencia: cantMeses [
nombre := unNombre .
laboratorio := unLaboratorio .
especie := unaEspecie .
mesesVigencia := cantMeses .
]
