Class {
	#name : 'VentanaDatosVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'origen',
		'botonCerrar',
		'recuadroClientes',
		'etiqueta1',
		'etiqueta2'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
VentanaDatosVisual >> cerrar [ 
	self delete
]

{ #category : 'initialization' }
VentanaDatosVisual >> crearComponentes [ 
|x y textoClientes textoMascotas |
    x := 10.
    y := 15.

    etiqueta1 := LabelMorph new
        contents: 'Datos de clientes y mascotas';
        color: Color black;
        yourself.
    etiqueta1 position: origen + (x@y).
    self addMorph: etiqueta1.

    y := y + 30.
    textoClientes := veterinaria listarClientes.
    recuadroClientes := RubScrolledTextMorph new.
    recuadroClientes position: origen + (x@y).
    recuadroClientes extent: 380@140.
    recuadroClientes textArea beReadOnly.
    recuadroClientes color: (Color fromHexString: '463168').
	 recuadroClientes setText: textoClientes .
	 self addMorph: recuadroClientes.
	
	y := y + 160.
	textoMascotas := (veterinaria cantMascotas) asString.
	etiqueta2 := LabelMorph new
        contents: 'Cantidad de mascotas en la veterinaria: ', textoMascotas ;
        color: Color black;
        yourself.
    etiqueta2 position: origen + (x@y).
    self addMorph: etiqueta2.

    botonCerrar := BotonAccion new
	     mouseAction: [ self cerrar ];
  	     position: origen + (320@250);
	     label: 'Cerrar';
	     color:(Color fromHexString: '463168');
	     borderColor: Color black;
	     yourself.
    self addMorph: botonCerrar.
]

{ #category : 'initialization' }
VentanaDatosVisual >> initialize: unaVet [
   super initialize.
   self veterinaria: unaVet .
	self color: (Color fromHexString: '94CCE0').
	self position: 480@45.
	self bounds: (480@45 extent: 400@300).
	origen := self innerBounds origin.
	
   self crearComponentes .
]

{ #category : 'accessing' }
VentanaDatosVisual >> veterinaria: unaVeterinaria [
veterinaria := unaVeterinaria 
]
