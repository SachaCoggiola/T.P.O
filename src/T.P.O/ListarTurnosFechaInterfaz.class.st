Class {
	#name : 'ListarTurnosFechaInterfaz',
	#superclass : 'PanelMorph',
	#instVars : [
		'fechaInput',
		'resultadoMorph',
		'veterinaria',
		'fechaObjeto',
		'origen',
		'botonListarTurnos'
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

    "2. Campo para ingresar la fecha (StringMorph editable)"
    y := y + 30.
    fechaInput := LabelWithTextFieldMorph new
	     label: 'Fecha: ';
	     color: Color lightBlue;
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: fechaInput.

    "3. Botón para listar los turnos luego de ingresar la fecha"
    y := fechaInput position y + 30.
    botonListarTurnos := BotonAccion new
	     mouseAction: [ self listarTurnos ];
        position: origen + (x@y);
	     label: 'Listar turnos con esta fecha';
        yourself.
    self addMorph: botonListarTurnos .

    "4. Mostrar resultados (StringMorph)"
    y := y + 40.
    resultadoMorph := StringMorph new
        contents: '';
        color: Color blue;
        position: origen + (x@y);
        yourself.
    self addMorph: resultadoMorph.

]

{ #category : 'initialization' }
ListarTurnosFechaInterfaz >> initialize [
    super initialize.
    self
        color: Color veryLightGray;
        borderColor: Color black;
        borderWidth: 2;
        position: 45@45;
        bounds: (45@45 extent: 350@420).
	 origen := self innerBounds origin.
    self crearComponentes .
]

{ #category : 'method' }
ListarTurnosFechaInterfaz >> listarTurnos [
| turnosFiltrados textoResultado  esValido |

    esValido := true.

    "Verificar que resultadoMorph exista y no sea nil"
    resultadoMorph ifNil: [
        resultadoMorph := StringMorph new
            contents: 'Error: resultadoMorph no inicializado';
            color: Color red;
            position: 20 @ 200;
            yourself.
        self addMorph: resultadoMorph.
        ^ self
    ].

    esValido := self validarFecha .

(esValido) ifTrue: [  

   "Obtener turnos de Veterinaria"
      turnosFiltrados := veterinaria listarTurnosFecha: fechaObjeto.

    "Generar texto para mostrar en el resultado"
      textoResultado := String streamContents: [ :stream |
          turnosFiltrados ifEmpty: [
              stream nextPutAll: 'No hay turnos para el ', fechaObjeto asString, '.'.
          ] ifNotEmpty: [
              stream nextPutAll: 'Turnos para el ', fechaObjeto asString, ':'; cr; cr.
              turnosFiltrados do: [ :turno |
                  stream nextPutAll: '- ', turno toString; cr.
              ].
          ].
      ].

    "Mostrar resultados"
      resultadoMorph contents: textoResultado.
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
        resultadoMorph contents: 'Formato incorrecto. Use DD MM YYYY (ej: 01 08 2026)'.
        esValido := false
    ].

^esValido .
]

{ #category : 'accessing' }
ListarTurnosFechaInterfaz >> veterinaria: unaVeterinaria [
veterinaria := unaVeterinaria .
]
