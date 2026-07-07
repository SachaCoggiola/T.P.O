Class {
	#name : 'TurnoTratamiento',
	#superclass : 'Turno',
	#instVars : [
		'unTratamiento'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
TurnoTratamiento class >> crearConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico yTratamiento: tratamiento [
|unTurnoTratamiento|
unTurnoTratamiento := self new.
unTurnoTratamiento inicializarConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico yTratamiento: tratamiento.
^unTurnoTratamiento .
]

{ #category : 'getters' }
TurnoTratamiento >> getTratamiento [
^unTratamiento .
]

{ #category : 'initialization' }
TurnoTratamiento >> inicializarConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico yTratamiento: tratamiento [
self inicializarConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico.

unTratamiento := tratamiento .

]
