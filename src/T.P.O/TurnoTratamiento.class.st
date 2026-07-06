Class {
	#name : 'TurnoTratamiento',
	#superclass : 'Turno',
	#instVars : [
		'unTratamiento'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'initialization' }
TurnoTratamiento >> inicializarConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico yTratamiento: tratamiento [
self inicializarConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico.

unTratamiento := tratamiento .

]
