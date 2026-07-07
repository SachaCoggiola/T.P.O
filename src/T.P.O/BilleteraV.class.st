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
BilleteraV class >> crearConNombre: unNombre [
|unaBilletera|
unaBilletera := self crearCon: unNombre .
recargo := 5.
^unaBilletera .
]
