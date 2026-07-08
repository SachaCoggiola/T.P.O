Class {
	#name : 'Diagnostico',
	#superclass : 'Object',
	#instVars : [
		'fecha',
		'descripcion',
		'medico',
		'mascota',
		'colTratamientos',
		'id'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
Diagnostico class >> crearConFecha: unaFecha conDescripcion: unaDescripcion conMedico: unMedico conMascota: unaMascota conId: unId [
	|diagnostico|
		diagnostico := self new.
		diagnostico inicializarConFechaDiagnostico: unaFecha conDescripcion: unaDescripcion conMedico: unMedico conMascota: unaMascota conId: unId.
		^diagnostico. 
]

{ #category : 'propiosDelTipo' }
Diagnostico >> calcularMontoFinal [
^colTratamientos inject: 0 into: [ :montoFinal :tratamiento | montoFinal + tratamiento calcularMonto].
]

{ #category : 'propiosDelTipo' }
Diagnostico >> equals: otroDiagnostico [
^(id = (otroDiagnostico getId)).
]

{ #category : 'getters' }
Diagnostico >> getDescripcion [
^descripcion.
]

{ #category : 'getters' }
Diagnostico >> getFecha [
^fecha.
]

{ #category : 'getters' }
Diagnostico >> getId [ 
^id.
]

{ #category : 'getters' }
Diagnostico >> getMascota [
^mascota .
]

{ #category : 'getters' }
Diagnostico >> getMedico [
^medico.
]

{ #category : 'initialization' }
Diagnostico >> inicializarConFechaDiagnostico: unaFecha conDescripcion: unaDescripcion conMedico: unMedico conMascota: unaMascota conId: unId [
	fecha := unaFecha.
	descripcion := unaDescripcion.
	medico := unMedico.
	mascota := unaMascota.
	colTratamientos := OrderedCollection new.
	id := unId.
]

{ #category : 'propiosDelTipo' }
Diagnostico >> registrarTratamiento: unTratamiento [
	(unTratamiento esValido) ifTrue: [ colTratamientos add: unTratamiento ].
]

{ #category : 'propiosDelTipo' }
Diagnostico >> tieneTratamiento: otroTratamiento [
^( colTratamientos anySatisfy:
	[:cadaTratamiento | cadaTratamiento equals: otroTratamiento ] ).
]
