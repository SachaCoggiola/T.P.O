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
		'botonCerrar',
		'mascotaId'
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
| listaDiagnosticosM textoResultado esValido listaAplicacionesM |

    esValido := self validarId .

(esValido) ifTrue: [  
	   self informar: 'ID ingresado correctamente'.
	   mascotaObjeto := veterinaria buscarMascotaConId: mascotaId .

      listaDiagnosticosM := veterinaria historialClinicoDe: mascotaObjeto .
      
      textoResultado := ''.

      (listaDiagnosticosM ) ifEmpty: [ 
	textoResultado := 'No hay Diagnosticos para ', mascotaObjeto getNombre , '.'.
	                   ] ifNotEmpty: [ 
	textoResultado := 'Diagnosticos para ', mascotaObjeto getNombre, ':'; cr; cr.
              listaDiagnosticosM do: [ :diag | '- ', diag toString; cr. ].
   listaAplicacionesM := mascotaObjeto getColAplicaciones .
   textoResultado := textoResultado + 'Y Aplicaciones de vacunas:'; cr; cr.
              listaAplicacionesM do: [ :ap | '- ', ap toString; cr. ].
	                   ].
   
      resultadoMorph contents: textoResultado.
].
]

{ #category : 'propiosDelTipo' }
HistorialClinicoDeVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
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
	| numero valido |
	valido := true.
	mascotaIdInput contents isEmpty ifTrue: [
		self informar: 'Debe ingresar un Id.'.
		valido := false.
	].
	valido ifTrue: [ 
		mascotaId := mascotaIdInput contents.
		(mascotaId allSatisfy: [ :c | c isDigit ]) ifFalse: [
		self informar: 'El Id debe contener únicamente números.'.
		valido := false.
		].
		valido ifTrue: [ 
			numero := mascotaId asNumber.
			((numero > 0) and: [ numero < 100000000 ]) ifFalse: [
			self informar: 'El Id debe tener entre 1 y 8 dígitos.'.
			valido := false
			].
		].
	].
	^valido
]

{ #category : 'accessing' }
HistorialClinicoDeVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria .
]
