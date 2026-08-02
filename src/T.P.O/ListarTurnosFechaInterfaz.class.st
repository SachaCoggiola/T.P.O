Class {
	#name : 'ListarTurnosFechaInterfaz',
	#superclass : 'PanelMorph',
	#instVars : [
		'fechaInput',
		'resultadoMorph',
		'veterinaria',
		'fechaObjeto'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
ListarTurnosFechaInterfaz >> agregarBotonListarTurnos [
    | x y boton |

    x := 20.
    y := fechaInput position y + 40.

    boton := PluggableButtonMorph new
        model: self;
        label: 'Listar turnos';
        action: #listarTurnos;
        yourself.
    boton position: x @ y.
    self addMorph: boton.
]

{ #category : 'propiosDelTipo' }
ListarTurnosFechaInterfaz >> cerrar [ 
self delete.
]

{ #category : 'initialization' }
ListarTurnosFechaInterfaz >> crearComponentes [
    | x y etiqueta |

    x := 20.
    y := 20.

    "1. Etiqueta: 'Ingrese fecha (DD MM YYYY):'"
    etiqueta := LabelMorph new
        contents: 'Ingrese fecha (DD MM YYYY):';
        color: Color black;
        yourself.
    etiqueta position: x @ y.
    self addMorph: etiqueta.

    "2. Campo para ingresar la fecha (StringMorph editable)"
    y := y + 30.
    fechaInput := StringMorph new
        contents: '01 08 2026';  "Texto guía en formato DD MM YYYY"
        color: Color black;
        borderColor: Color gray;
        borderWidth: 1;
        extent: 200 @ 25;
        position: x @ y;
        backgroundColor: Color white;
        yourself.
    self addMorph: fechaInput.

    "3. Mostrar resultados (StringMorph)"
    y := y + 40.
    resultadoMorph := StringMorph new
        contents: '';
        color: Color blue;
        position: x @ y;
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
        extent: 400 @ 300.
    self crearComponentes .
]

{ #category : 'method' }
ListarTurnosFechaInterfaz >> listarTurnos [
| turnosFiltrados textoResultado  esValido |

"COMENTARIO: no sé como modificar el input para testearlo, revisar en la etapa de testeo"

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
	   self agregarBotonListarTurnos .
	
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

  "Normalizar el formato: reemplazar guiones por espacios"
    fechaTexto := fechaTexto copyReplaceAll: '-' with: ' '.

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
