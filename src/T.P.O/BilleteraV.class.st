Class {
	#name : 'BilleteraV',
	#superclass : 'MedioPago',
	#classVars : [
		'recargo'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'creation' }
BilleteraV class >> crearConNombre [
	|unaBilletera|
		unaBilletera := self new. 
		unaBilletera inicializarBilletera.
^unaBilletera .
]

{ #category : 'getters' }
BilleteraV >> getRecargo [ 
^recargo.
]

{ #category : 'initialization' }
BilleteraV >> inicializarBilletera [
	nombre := 'billeteraVirtual'.
	recargo ifNil: [ recargo := 5 ]. 
	
]
