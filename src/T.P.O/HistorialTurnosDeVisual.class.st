Class {
	#name : 'HistorialTurnosDeVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'dniInput',
		'resultadoMorph',
		'veterinaria',
		'clienteObjeto',
		'origen',
		'botonListarTurnos',
		'botonCerrar',
		'dni'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
HistorialTurnosDeVisual >> cerrar [ 
self delete.
]

{ #category : 'initialization' }
HistorialTurnosDeVisual >> crearComponentes [
    | x y etiqueta |

    x := 5.
    y := 15.

    etiqueta := LabelMorph new
        contents: 'Ingrese DNI del Cliente:';
        color: Color black;
        yourself.
    etiqueta position: origen + (x@y).
    self addMorph: etiqueta.


    y := y + 30.
    dniInput := LabelWithTextFieldMorph new
	     label: 'DNI: ';
	     color: Color lightBlue;
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: dniInput.


    y := dniInput position y + 30.
    botonListarTurnos := BotonAccion new
	     mouseAction: [ self listarTurnos ];
        position: origen + (x@y);
	     label: 'Listar facturas pendientes del Cliente';
        yourself.
    self addMorph: botonListarTurnos .


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

{ #category : 'propiosDelTipo' }
HistorialTurnosDeVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
HistorialTurnosDeVisual >> initialize [
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
HistorialTurnosDeVisual >> listarTurnos [
| turnosCliente textoResultado esValido |

    esValido := self validarDni .

(esValido) ifTrue: [  

      self informar: 'DNI ingresado correctamente'.
      clienteObjeto := veterinaria buscarClienteConDni: dni .

      turnosCliente := veterinaria historialTurnosDe: clienteObjeto .

      textoResultado := ''.

      (turnosCliente ) ifEmpty: [ 
	textoResultado := 'No hay turnos de ', clienteObjeto getNombre, '.'.
	                   ] ifNotEmpty: [ 
	textoResultado := 'Turnos de ', clienteObjeto getNombre, ':'; cr; cr.
              turnosCliente do: [ :turno | '- ', turno toString; cr. ].
	                   ].

      resultadoMorph contents: textoResultado.
].
]

{ #category : 'method' }
HistorialTurnosDeVisual >> validarDni [
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
HistorialTurnosDeVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria .
]
