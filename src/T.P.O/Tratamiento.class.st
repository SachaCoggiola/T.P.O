Class {
	#name : 'Tratamiento',
	#superclass : 'Object',
	#instVars : [
		'fecha',
		'motivo',
		'estado'
	],
	#classVars : [
		'costoBase'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
Tratamiento >> calcularMonto [
^costoBase.
]

{ #category : 'propiosDelTipo' }
Tratamiento >> equals: otroTrat [
^((fecha asDate = otroTrat getFecha ) and: [(motivo = otroTrat getMotivo) and: (estado = otroTrat getEstado)]).
]

{ #category : 'propiosDelTipo' }
Tratamiento >> esFarmacologico [
^false
]

{ #category : 'propiosDelTipo' }
Tratamiento >> esValido [
	|diaValido|
		diaValido := ( self obtenerDia between: 2 and: 6 ).
		diaValido := self verificarTratamiento: diaValido.
^diaValido.
		
		
]

{ #category : 'getters' }
Tratamiento >> getCostoBase [
^costoBase.
]

{ #category : 'getters' }
Tratamiento >> getEstado [
^estado .
]

{ #category : 'getters' }
Tratamiento >> getFecha [
^fecha .
]

{ #category : 'getters' }
Tratamiento >> getMotivo [
^motivo.
]

{ #category : 'initialization' }
Tratamiento >> inicializarConFecha: unaFecha conMotivo: unMotivo [ 
	costoBase ifNil: [ costoBase := 5000 ].
	fecha := unaFecha.
	motivo := unMotivo.
	estado := 'pendiente'.
]

{ #category : 'getters' }
Tratamiento >> obtenerDia [
^fecha dayOfWeek.
]

{ #category : 'setters' }
Tratamiento >> setEstado: unEstado [
	( { 'pendiente' . 'cancelado' . 'realizado' } includes: unEstado ) ifTrue: [ estado := unEstado ].
]

{ #category : 'propiosDelTipo' }
Tratamiento >> toString [
^ ('Fecha: ', fecha asString,
      ' | Motivo: ' , motivo,
      ' | Estado: ' , estado)
]

{ #category : 'propiosDelTipo' }
Tratamiento >> verificarTratamiento: dia [
^false.
]
