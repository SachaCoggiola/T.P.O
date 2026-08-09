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

{ #category : 'propiosDelTipo' }
Turno >> cancelarTurno [
|rta|
  (estado = 'pendiente') 
    ifTrue: [
	   estado := 'cancelado'. 
	   rta := true 
	 ] 
    ifFalse: [ 
	  rta := false 
	 ].
^rta.
]

{ #category : 'propiosDelTipo' }
Turno >> confirmarTurno [
	estado := 'confirmado'.
]

{ #category : 'comparing' }
Turno >> equals: otroTurno [
^( (fecha = otroTurno getFecha) and: 
   [ (hora = otroTurno getHora) and: (unMedico = otroTurno getMedico) ] ).
]

{ #category : 'getters' }
Turno >> getCliente [
^unCliente.
]

{ #category : 'getters' }
Turno >> getEstado [
^estado.
]

{ #category : 'getters' }
Turno >> getFecha [
^fecha.
]

{ #category : 'getters' }
Turno >> getHora [
^hora.
]

{ #category : 'getters' }
Turno >> getMascota [
^unaMascota.
]

{ #category : 'getters' }
Turno >> getMedico [
^unMedico .
]

{ #category : 'getters' }
Turno >> getMotivo [
^motivo.
]

{ #category : 'initialization' }
Turno >> inicializarConFecha: unaFecha yHora: unaHora yMotivo: unMotivo yCliente: cliente yMascota: mascota yMedico: medico [
	fecha := unaFecha .
	hora := unaHora .
	motivo := unMotivo .
	unCliente := cliente .
	unaMascota := mascota .
	unMedico := medico .
	estado := 'pendiente'.
]

{ #category : 'setters' }
Turno >> setEstado: unEstado [
	( { 'pendiente' . 'confirmado' . 'cancelado' . 'atendido' . 'ausente' } includes: unEstado) ifTrue: [ estado := unEstado ].
]

{ #category : 'propiosDelTipo' }
Turno >> tieneCliente: otroCliente [
^(unCliente equals: otroCliente ).
]

{ #category : 'propiosDelTipo' }
Turno >> tieneFecha: otraFecha [
^(otraFecha = fecha).
]

{ #category : 'propiosDelTipo' }
Turno >> tieneMedico: otroMedico [
^(unMedico equals: otroMedico).
]

{ #category : 'propiosDelTipo' }
Turno >> tieneTratamiento [ 
^false
]

{ #category : 'getters' }
Turno >> toString [
^ ('Turno: ', fecha asString, ' - ', hora asString,
      ' | Cliente: ', unCliente toString ,
      ' | Mascota: ', unaMascota toString ,
      ' | Médico: ', unMedico toString ).
]

{ #category : 'propiosDelTipo' }
Turno >> validarTurno [
"Valida que el turno tenga una fecha y hora mayor a la actual"

^( (fecha >= Date today ) and: (hora >= Time now) ).
]

{ #category : 'propiosDelTipo' }
Turno >> verificarDisponibilidad: unTurno [
	|rta2 rta1|
		rta2 :=  true.
		rta1 := ( (unTurno getFecha = fecha) and: (unTurno getHora = hora) ).
		rta1 ifTrue: [ 
			rta2 := ((unTurno getMedico) equals: unMedico ) not.
		].

^rta2.
]

{ #category : 'propiosDelTipo' }
Turno >> verificarMascota [
^( unCliente tieneMascota: unaMascota ).
]
