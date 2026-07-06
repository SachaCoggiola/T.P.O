Class {
	#name : 'Turno',
	#superclass : 'Object',
	#instVars : [
		'fecha',
		'hora',
		'estado',
		'motivo',
		'unCliente',
		'unaMascota',
		'unMedico'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'initialization' }
Turno >> inicializarConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico [
fecha := unaFecha .
hora := unaHora .
motivo := unMotivo .
unCliente := cliente .
unaMascota := mascota .
unMedico := medico .
]
