Class {
	#name : 'FacturarDiagnostico',
	#superclass : 'BorderedMorph',
	#instVars : [
		'campoDiagnostico',
		'diagnostico',
		'veterinaria',
		'origen',
		'botonFacturar',
		'botonCerrar',
		'etiqueta',
		'botonBuscarDiagnostico',
		'resultadoMorph'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
FacturarDiagnostico >> buscarDiagnostico [
	|contenido|
	contenido := campoDiagnostico contents.
	contenido trimBoth isEmpty ifFalse: [
		(contenido allSatisfy: [ :c | c isDigit ]) ifFalse: [
			self informar: 'El id debe contener únicamente números.'.
		] ifTrue: [ 
			diagnostico := veterinaria buscarDiagnosticoConId: contenido asNumber.
			diagnostico 
			ifNil: [ self informar: 'No se ha encontrado un diagnostico con el id ingresado' ] 
			ifNotNil: [ self informar: 'Diagnostico encontrado'.
				          resultadoMorph setText: diagnostico toString ] .
		].
	] ifTrue: [ self informar: 'Ingrese el id de un diagnostico' ]

]

{ #category : 'propiosDelTipo' }
FacturarDiagnostico >> cerrar [
	self delete.
]

{ #category : 'propiosDelTipo' }
FacturarDiagnostico >> facturar [
	diagnostico ifNil: [ self informar: 'Buscar el diagnostico el cual quiera facturar' ] 
	ifNotNil: [ 
	(veterinaria generarFactura: diagnostico) 
	ifTrue: [ 
			self informar: 'Se ha facturado el diagnostico exitosamente']
	ifFalse: [ 
			self informar: 'No se ha podido facturar el diagnostico' ]
		 ] 

]

{ #category : 'propiosDelTipo' }
FacturarDiagnostico >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
FacturarDiagnostico >> initialize [
   super initialize.
	self color: (Color fromHexString: '063F70').
	self position: 45@45.
	self bounds: (45@45 extent: 450@380).
	origen := self innerBounds origin.
	
	botonFacturar := BotonAccion new.
	self addMorph: botonFacturar .
	botonFacturar mouseAction: [ self facturar ].	
	botonFacturar position: (130@335).
	botonFacturar label: 'Facturar diagnostico'.

	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [ self cerrar ].
	botonCerrar position: (330@335).
	botonCerrar label: 'Cerrar'.
	
	etiqueta := LabelMorph new.
	self addMorph: etiqueta.
	etiqueta contents: 'Ingrese el Id del diagnostico al cual quiera facturar.'.
	etiqueta position: origen + (5@15).
	etiqueta color: Color white .
	
	campoDiagnostico := LabelWithTextFieldMorph new.
	self addMorph: campoDiagnostico.
	campoDiagnostico label: 'Id:'.
	campoDiagnostico position: origen + (20@60).
	
	resultadoMorph := RubScrolledTextMorph new
        setText: '';
        color: (Color fromHexString: '662806');
        borderColor: Color black;
        borderWidth: 2;
        position: origen + (20@(campoDiagnostico position y + 30));
		  extent: (390@80);
        yourself.
   resultadoMorph textArea beReadOnly.
   self addMorph: resultadoMorph.
	
	botonBuscarDiagnostico := BotonAccion new.
	self addMorph: botonBuscarDiagnostico .
	botonBuscarDiagnostico mouseAction: [ self buscarDiagnostico ].	
	botonBuscarDiagnostico position: (300@115).
	botonBuscarDiagnostico label: 'Buscar diagnostico'.

]

{ #category : 'accessing' }
FacturarDiagnostico >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria 
]
