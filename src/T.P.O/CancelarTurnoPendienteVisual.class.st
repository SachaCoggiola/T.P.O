Class {
	#name : 'CancelarTurnoPendienteVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'fechaInput',
		'fechaObjeto',
		'dniMedicoInput',
		'dniMedico',
		'horaStrInput',
		'horaObjeto',
		'veterinaria',
		'turnoObjeto',
		'origen',
		'botonCancelarTurno',
		'botonCerrar'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
CancelarTurnoPendienteVisual >> cancelarTurno [ 
| fueCancelado |

(self validarFecha) ifTrue: [  
	self informar: 'Fecha ingresada correctamente'.
	(self validarHora) ifTrue: [ 
      self informar: 'Hora ingresada correctamente'.
      (self validarDni) ifTrue: [  
	     self informar: 'DNI ingresado correctamente'.
	
        turnoObjeto := veterinaria buscarTurnoConFecha: fechaObjeto yHora: horaObjeto yDniMedico: dniMedico asNumber.
        (turnoObjeto) ifNotNil: [  
          fueCancelado := veterinaria cancelarTurnoPendiente: turnoObjeto .

          (fueCancelado) ifTrue: [ 
	         self informar: 'El turno ', turnoObjeto toString, ' fue cancelado.', 
	         String cr.
	       ] ifFalse: [ 
	         self informar: 'El turno ', turnoObjeto toString, ' no estaba pendiente y no se pudo cancelar.', String cr.
	       ].

        ] ifNil: [ self informar: 'No existe el turno ingresado' ]
      ].
   ].
].  
]

{ #category : 'propiosDelTipo' }
CancelarTurnoPendienteVisual >> cerrar [ 
self delete.
]

{ #category : 'initialization' }
CancelarTurnoPendienteVisual >> crearComponentes [
    | x y etiqueta |

    x := 5.
    y := 15.

    etiqueta := LabelMorph new
        contents: 'Ingrese fecha (DD MM YYYY), hora (00:00),',String cr,' y DNI del médico (sin puntos):';
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

    y := fechaInput position y + 30.
    horaStrInput := LabelWithTextFieldMorph new
	     label: 'Hora: ';
	     color: (Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: horaStrInput .

    y := horaStrInput position y + 30.
    dniMedicoInput := LabelWithTextFieldMorph new
	     label: 'DNI del Médico: ';
	     color: (Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: dniMedicoInput .

 
    y := dniMedicoInput position y + 30.
    botonCancelarTurno := BotonAccion new
	     mouseAction: [ self cancelarTurno ];
        position: origen + (x@y);
        color:(Color fromHexString: '313668');
	     borderColor: Color black;
	     label: 'Cancelar el Turno pendiente';
        yourself.
    self addMorph: botonCancelarTurno .

    "4. Botón para cerrar la ventana"
    y := y + 40.
    botonCerrar := BotonAccion new
	     mouseAction: [ self cerrar ];
  	     position: origen + (x@y);
	     label: 'Cerrar';
	     color:(Color fromHexString: '313668');
	     borderColor: Color black;
	     yourself.
    self addMorph: botonCerrar.

]

{ #category : 'propiosDelTipo' }
CancelarTurnoPendienteVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
CancelarTurnoPendienteVisual >> initialize [
    super initialize.
    self
        color: (Color fromHexString: '92d2bf');
        borderColor: Color black;
        borderWidth: 2;
        position: 45@45;
        bounds: (45@45 extent: 410@410).
	 origen := self innerBounds origin.
    self crearComponentes .
]

{ #category : 'method' }
CancelarTurnoPendienteVisual >> validarDni [
	| numero valido |
	valido := true.
	(dniMedicoInput contents isEmpty) ifTrue: [
		self informar: 'Debe ingresar un DNI.'.
		valido := false.
	].
	valido ifTrue: [ 
		dniMedico := dniMedicoInput contents.
		(dniMedico allSatisfy: [ :c | c isDigit ]) ifFalse: [
		self informar: 'El DNI debe contener únicamente números.'.
		valido := false.
		].
		valido ifTrue: [ 
			numero := dniMedico asNumber.
			((numero > 0) and: (numero < 100000000)) ifFalse: [
			self informar: 'El DNI debe tener entre 1 y 8 dígitos.'.
			valido := false
			].
		].
	].
	^valido
]

{ #category : 'method' }
CancelarTurnoPendienteVisual >> validarFecha [
|esValido partesFecha fechaTexto |
    esValido := true.

    fechaTexto := fechaInput contents asString trimBoth.

    ((fechaTexto includesSubstring: ' ') and: (fechaTexto isNotEmpty)) ifTrue: [  
  "Pasamos manualmente la fecha a int en formato DD MM YYYY"
    partesFecha := fechaTexto findTokens: ' '.
    fechaObjeto := [
        Date
            year: partesFecha third asInteger
            month: partesFecha second asInteger
            day: partesFecha first asInteger
    ] on: Error do: [
        self informar: 'Formato incorrecto en fecha. Use DD MM YYYY (ej: 01 08 2026)'.
        esValido := false
    ].
] ifFalse: [ esValido := false.
self informar: 'Formato incorrecto en fecha. Use DD MM YYYY (ej: 01 08 2026)'.
 ].

^esValido .
]

{ #category : 'method' }
CancelarTurnoPendienteVisual >> validarHora [
|valido|
  valido := true.

  horaStrInput := horaStrInput contents asString trimBoth.

 (horaStrInput isEmpty) ifTrue: [ 
	self informar: 'Debe ingresar una hora'.
	valido := false.
  ]. 
(valido) ifTrue: [ 
	"Asumo que los índices de String comienzan en 0"
	((horaStrInput includesSubstring: ':') and: (horaStrInput size = 5)) ifFalse: [ 
		self informar: 'Debe seguir el formato 00:00 en hora'.
		valido := false.
	 ].
].

(valido) ifTrue: [ 
	horaObjeto := Time fromString: horaStrInput .
	 ].

^valido.
]

{ #category : 'accessing' }
CancelarTurnoPendienteVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria .
]
