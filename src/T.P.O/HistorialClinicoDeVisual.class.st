Class {
	#name : 'HistorialClinicoDeVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'mascotaIdInput',
		'resultadoMorph',
		'veterinaria',
		'mascotaObjeto',
		'origen',
		'botonHistorialClinico',
		'botonCerrar'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
HistorialClinicoDeVisual >> cerrar [ 
self delete.
]

{ #category : 'initialization' }
HistorialClinicoDeVisual >> crearComponentes [
    | x y etiqueta |

    x := 5.
    y := 15.

    etiqueta := LabelMorph new
        contents: 'Ingrese el ID de su Mascota:';
        color: Color black;
        yourself.
    etiqueta position: origen + (x@y).
    self addMorph: etiqueta.

    y := y + 30.
    mascotaIdInput := LabelWithTextFieldMorph new
	     label: 'ID Mascota: ';
	     color: Color lightBlue;
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: mascotaIdInput .

    y := mascotaIdInput position y + 30.
    botonHistorialClinico := BotonAccion new
	     mouseAction: [ self historialClinico ];
        position: origen + (x@y);
	     label: 'Listar turnos con esta fecha';
        yourself.
    self addMorph: botonHistorialClinico .

    y := y + 40.
    botonCerrar := BotonAccion new
	     mouseAction: [ self cerrar ];
  	     position: origen + (x@y);
	     label: 'Cerrar';
	    yourself.
    self addMorph: botonCerrar.

    y := y + 40.
    resultadoMorph := StringMorph new
        contents: '';
        color: Color blue;
        position: origen + (x@y);
        yourself.
    self addMorph: resultadoMorph.

]

{ #category : 'method' }
HistorialClinicoDeVisual >> historialClinico [
| listaDiagnosticosM textoResultado esValido |

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

    esValido := self validarId .

(esValido) ifTrue: [  

      listaDiagnosticosM := veterinaria historialClinicoDe: mascotaObjeto .

      textoResultado := String streamContents: [ :stream |
          listaDiagnosticosM ifEmpty: [
              stream nextPutAll: 'No hay diagnosticos para ', mascotaObjeto asString, '.'.
          ] ifNotEmpty: [
              stream nextPutAll: 'Diagnosticos de ', mascotaObjeto asString, ':'; cr; cr.
              listaDiagnosticosM do: [ :diag |
                  stream nextPutAll: '- ', diag asString; cr.
              ].
          ].
      ].

      resultadoMorph contents: textoResultado.
].
]

{ #category : 'initialization' }
HistorialClinicoDeVisual >> initialize [
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
HistorialClinicoDeVisual >> validarId [ 
|esValido|
 
]

{ #category : 'accessing' }
HistorialClinicoDeVisual >> veterinaria: unaVeterinaria [
veterinaria := unaVeterinaria .
]
