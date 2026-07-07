Class {
	#name : 'TurnoConsulta',
	#superclass : 'Turno',
	#instVars : [
		'tipoAtencion'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
TurnoConsulta class >> crearConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico yTipoAtencion: unTipo [
|unTurnoConsulta|
unTurnoConsulta := self new.
unTurnoConsulta inicializarConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico yTipoAtencion: unTipo.
^unTurnoConsulta .
]

{ #category : 'getters' }
TurnoConsulta >> getTratamiento [
^nil.
]

{ #category : 'initialization' }
TurnoConsulta >> inicializarConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico yTipoAtencion: unTipo [
self inicializarConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico.

[ (unTipo = 'control') or: (unTipo = 'inicial') ] ifTrue: [ tipoAtencion := unTipo ].
]

{ #category : 'setters' }
TurnoConsulta >> setTipoAtencion: unTipo [
[ (unTipo = 'control') or: (unTipo = 'inicial') ] ifTrue: [ tipoAtencion := unTipo ].
]
