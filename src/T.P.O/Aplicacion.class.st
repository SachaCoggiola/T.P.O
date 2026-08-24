Class {
	#name : 'Aplicacion',
	#superclass : 'Object',
	#instVars : [
		'fecha',
		'unMedico',
		'unaVacuna'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
Aplicacion class >> crearConFecha: unaFecha conMedico: medico conVacuna: vacuna [
|unaAplicacion|
unaAplicacion := self new.
unaAplicacion inicializarConFecha: unaFecha conMedico: medico conVacuna: vacuna.
^unaAplicacion .

]

{ #category : 'comparing' }
Aplicacion >> equals: otraAp [
|iguales|
  iguales := ((fecha = otraAp getFecha asDate) and: [ (unMedico equals: otraAp getMedico) and: (unaVacuna equals: otraAp getVacuna) ]).
^iguales 
]

{ #category : 'propiosDelTipo' }
Aplicacion >> estaVencida [
^ [ ( unaVacuna getMesesVigencia + fecha ) < Date today ]
]

{ #category : 'getters' }
Aplicacion >> getFecha [
^fecha.
]

{ #category : 'getters' }
Aplicacion >> getMedico [
^unMedico.
]

{ #category : 'getters' }
Aplicacion >> getVacuna [
^unaVacuna.
]

{ #category : 'initialization' }
Aplicacion >> inicializarConFecha: unaFecha conMedico: medico conVacuna: vacuna [
	fecha := unaFecha .
	unMedico := medico.
	unaVacuna := vacuna.

]

{ #category : 'propiosDelTipo' }
Aplicacion >> tieneRefuerzo: otraAplicacion [
^ unaVacuna equals: ( otraAplicacion getVacuna )
]

{ #category : 'propiosDelTipo' }
Aplicacion >> tieneVacuna: otraVacuna [
^(unaVacuna equals: otraVacuna )
]

{ #category : 'getters' }
Aplicacion >> toString [
^ ('Aplicacion: ', fecha asString,
      ' | ', unaVacuna toString,
      ' | ', 'Médico: ' , unMedico toString).
]
