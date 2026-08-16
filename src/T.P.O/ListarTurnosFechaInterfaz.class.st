Class {
	#name : 'ListarTurnosFechaInterfaz',
	#superclass : 'BorderedMorph',
	#instVars : [
		'fechaInput',
		'resultadoMorph',
		'veterinaria',
		'fechaObjeto',
		'origen',
		'botonListarTurnos',
		'botonCerrar'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
ListarTurnosFechaInterfaz >> cerrar [ 
self delete.
]

{ #category : 'initialization' }
ListarTurnosFechaInterfaz >> crearComponentes [
    | x y etiqueta |

    x := 5.
    y := 15.

    "1. Etiqueta: 'Ingrese fecha (DD MM YYYY):'"
    etiqueta := LabelMorph new
        contents: 'Ingrese fecha (DD MM YYYY):';
        color: Color black;
        yourself.
    etiqueta position: origen + (x@y).
    self addMorph: etiqueta.

    "2. Campo para ingresar la fecha"
    y := y + 30.
    fechaInput := LabelWithTextFieldMorph new
	     label: 'Fecha: ';
	     color: (Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: fechaInput.

    "3. Botón para listar los turnos luego de ingresar la fecha"
    y := fechaInput position y + 30.
    botonListarTurnos := BotonAccion new
	     mouseAction: [ self listarTurnos ];
        position: origen + (x@y);
        color:(Color fromHexString: '313668');
        borderColor: Color black;
	     label: 'Listar turnos con esta fecha';
        yourself.
    self addMorph: botonListarTurnos .

    "4. Botón para cerrar la ventana"
    y := y + 40.
    botonCerrar := BotonAccion new
	     mouseAction: [ self cerrar ];
	     color:(Color fromHexString: '313668');
	     borderColor: Color black;
  	     position: origen + (x@y);
	     label: 'Cerrar';
	    yourself.
    self addMorph: botonCerrar.

    "5. Mostrar resultados"
    y := y + 40.
   resultadoMorph := RubScrolledTextMorph new
        setText: '';
        color: (Color fromHexString: '463168');
        position: origen + (x@y);
		  extent: (300@200);
        yourself.
    resultadoMorph textArea beReadOnly.
    self addMorph: resultadoMorph.

]

{ #category : 'propiosDelTipo' }
ListarTurnosFechaInterfaz >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
ListarTurnosFechaInterfaz >> initialize [
    super initialize.
    self
        color: (Color fromHexString: '92d2bf');
        borderColor: Color black;
        borderWidth: 2;
        position: 45@45;
        bounds: (45@45 extent: 350@420).
	 origen := self innerBounds origin.
    self crearComponentes .
]

{ #category : 'as yet unclassified' }
ListarTurnosFechaInterfaz >> listarTurnos [
| turnosFiltrados textoResultado  esValido |

    esValido := self validarFecha .

(esValido) ifTrue: [  

      self informar: 'Fecha ingresada correctamente'.

   "Llamamos al método de Veterinaria"
      turnosFiltrados := veterinaria listarTurnosFecha: fechaObjeto.

      textoResultado := ''.

      (turnosFiltrados) ifEmpty: [ 
	textoResultado := 'No hay turnos para el ', fechaObjeto asString, '.'.
	                   ] ifNotEmpty: [ 
	textoResultado := 'Turnos para el ', fechaObjeto asString, ':',String cr.
              turnosFiltrados do: [ :turno | textoResultado := (textoResultado, '- ', turno toString, String cr, String cr) ].
	                   ].

      resultadoMorph setText: textoResultado.
].
]

{ #category : 'method' }
ListarTurnosFechaInterfaz >> validarFecha [
|esValido partesFecha fechaTexto |
    esValido := true.

  "Obtener el texto ingresado en el campo fechaInput"
    fechaTexto := fechaInput contents asString trimBoth.

  "Pasamos manualmente la fecha a int en formato DD MM YYYY"
    partesFecha := fechaTexto findTokens: ' '.
    fechaObjeto := [
        Date
            year: partesFecha third asInteger
            month: partesFecha second asInteger
            day: partesFecha first asInteger
    ] on: Error do: [
        resultadoMorph setText: 'Formato incorrecto. Use DD MM YYYY (ej: 01 08 2026)'.
        esValido := false
    ].

^esValido .
]

{ #category : 'accessing' }
ListarTurnosFechaInterfaz >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria .
]
