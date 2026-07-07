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
