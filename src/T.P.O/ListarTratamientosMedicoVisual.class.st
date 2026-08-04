Class {
	#name : 'ListarTratamientosMedicoVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'dniInput',
		'resultadoMorph',
		'veterinaria',
		'medicoObjeto',
		'origen',
		'botonListarTratamientos',
		'botonCerrar',
		'dni'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
ListarTratamientosMedicoVisual >> cerrar [ 
self delete.
]

{ #category : 'initialization' }
ListarTratamientosMedicoVisual >> crearComponentes [
    | x y etiqueta |

    x := 5.
    y := 15.

    etiqueta := LabelMorph new
        contents: 'Ingrese DNI del Médico:';
        color: Color black;
        yourself.
    etiqueta position: origen + (x@y).
    self addMorph: etiqueta.


    y := y + 30.
    dniInput := LabelWithTextFieldMorph new
	     label: 'DNI: ';
	     color: (Color fromHexString: '655884');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: dniInput.


    y := dniInput position y + 30.
    botonListarTratamientos := BotonAccion new
	     mouseAction: [ self listarTratamientos ];
        position: origen + (x@y);
        color:(Color fromHexString: '655884');
	     borderColor: Color black;
	     label: 'Listar tratamientos del médico';
        yourself.
    self addMorph: botonListarTratamientos .


    y := y + 40.
    botonCerrar := BotonAccion new
	     mouseAction: [ self cerrar ];
  	     position: origen + (x@y);
	     color:(Color fromHexString: '655884');
	     borderColor: Color black;
	     label: 'Cerrar';
	    yourself.
    self addMorph: botonCerrar.


    y := y + 40.
    resultadoMorph := StringMorph new
        contents: '';
        color: Color black;
        position: origen + (x@y);
        yourself.
    self addMorph: resultadoMorph.

]

{ #category : 'propiosDelTipo' }
ListarTratamientosMedicoVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
ListarTratamientosMedicoVisual >> initialize [
    super initialize.
    self
        color: (Color fromHexString: 'eaebd1');
        borderColor: Color black;
        borderWidth: 2;
        position: 45@45;
        bounds: (45@45 extent: 350@420).
	 origen := self innerBounds origin.
    self crearComponentes .
]

{ #category : 'as yet unclassified' }
ListarTratamientosMedicoVisual >> listarTratamientos [
| tratamientosMedico textoResultado  esValido |

    esValido := self validarDni .

(esValido) ifTrue: [  

      self informar: 'DNI ingresado correctamente'.
      medicoObjeto := veterinaria buscarMedicoConDni: dni .

      tratamientosMedico := veterinaria listarTratamientosMedico: medicoObjeto .

      textoResultado := ''.

      (tratamientosMedico) ifEmpty: [ 
	textoResultado := 'No hay tratamientos realizados por ', medicoObjeto getNombre, '.'.
	                   ] ifNotEmpty: [ 
	textoResultado := 'Tratamientos por ', medicoObjeto getNombre, ':'; cr; cr.
              tratamientosMedico do: [ :trat | '- ', trat toString; cr. ].
	                   ].

      resultadoMorph contents: textoResultado.
].
]

{ #category : 'method' }
ListarTratamientosMedicoVisual >> validarDni [
	| numero valido |
	valido := true.
	dniInput contents isEmpty ifTrue: [
		self informar: 'Debe ingresar un DNI.'.
		valido := false.
	].
	valido ifTrue: [ 
		dni := dniInput contents.
		(dni allSatisfy: [ :c | c isDigit ]) ifFalse: [
		self informar: 'El DNI debe contener únicamente números.'.
		valido := false.
		].
		valido ifTrue: [ 
			numero := dni asNumber.
			((numero > 0) and: [ numero < 100000000 ]) ifFalse: [
			self informar: 'El DNI debe tener entre 1 y 8 dígitos.'.
			valido := false
			].
		].
	].
	^valido
]

{ #category : 'accessing' }
ListarTratamientosMedicoVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria .
]
