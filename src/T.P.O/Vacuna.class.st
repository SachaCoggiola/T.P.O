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

{ #category : 'creation' }
Vacuna class >> crearConNombre: unNombre yLab: unLaboratorio yEspecie: unaEspecie yMesesDeVigencia: cantMeses [
|unaVacuna|
unaVacuna := self new.
unaVacuna inicializarConNombre: unNombre yLab: unLaboratorio yEspecie: unaEspecie yMesesDeVigencia: cantMeses.
^unaVacuna .
]

{ #category : 'initialization' }
Vacuna >> inicializarConNombre: unNombre yLab: unLaboratorio yEspecie: unaEspecie yMesesDeVigencia: cantMeses [
nombre := unNombre .
laboratorio := unLaboratorio .
especie := unaEspecie .
[(cantMeses >= 1)]ifTrue: [mesesVigencia := cantMeses] .
]
