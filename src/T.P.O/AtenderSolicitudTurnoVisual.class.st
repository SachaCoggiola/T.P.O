Class {
	#name : 'AtenderSolicitudTurnoVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'fechaInput',
		'fechaObjeto',
		'dniMedicoInput',
		'dniMedico',
		'idMascotaInput',
		'idMascota',
		'horaStrInput',
		'horaObjeto',
		'veterinaria',
		'turnoObjeto',
		'origen',
		'botonCerrar',
		'botonAgendarTurno'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'method' }
AtenderSolicitudTurnoVisual >> agendarTurno [ 
| fueAgendado |

(self validarFecha) ifTrue: [  
	self informar: 'Fecha ingresada correctamente'.
	(self validarHora) ifTrue: [ 
      self informar: 'Hora ingresada correctamente'.
      (self validarDni) ifTrue: [  
	     self informar: 'DNI ingresado correctamente'.
	     (self validarId) ifTrue: [  
	      self informar: 'ID ingresado correctamente'.
	
        turnoObjeto := veterinaria buscarTurnoConFecha: fechaObjeto yHora: horaObjeto yDniMedico: dniMedico asNumber.
        (turnoObjeto) ifNotNil: [  
          fueAgendado := veterinaria agendarTurno: turnoObjeto .

          (fueAgendado) ifTrue: [ 
	         self informar: 'El turno ', turnoObjeto toString, ' fue agendado.', String cr.
	       ] ifFalse: [ 
	         self informar: 'El turno ', turnoObjeto toString, ' no se pudo agendar.', String cr.
	       ].
 
        ] ifNil: [ self informar: 'No existe el turno ingresado' ]
      ].
   ].
].  
].
]

{ #category : 'propiosDelTipo' }
AtenderSolicitudTurnoVisual >> cerrar [ 
self delete.
]

{ #category : 'initialization' }
AtenderSolicitudTurnoVisual >> crearComponentes [
    | x y etiqueta1 etiqueta2 |

    x := 10.
    y := 15.

    etiqueta1 := LabelMorph new
        contents: 'Ingrese fecha (DD MM YYYY), hora (00:00), DNI del médico,';
        color: Color black;
        yourself.
    etiqueta1 position: origen + (x@y).
    self addMorph: etiqueta1.

    y := y + 19.
    etiqueta2 := LabelMorph new
        contents: ' DNI del cliente y ID de la mascota (los 3 sin puntos):';
        color: Color black;
        yourself.
    etiqueta2 position: origen + (x@y).
    self addMorph: etiqueta2.


    y := y + 50.
    fechaInput := LabelWithTextFieldMorph new
	     label: 'Fecha: ';
	     color: (Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: fechaInput.

    y := fechaInput position y + 10.
    horaStrInput := LabelWithTextFieldMorph new
	     label: 'Hora: ';
	     color:(Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: horaStrInput .

    y := horaStrInput position y + 10.
    dniMedicoInput := LabelWithTextFieldMorph new
	     label: 'DNI del Médico: ';
	     color: (Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: dniMedicoInput .

     y := dniMedicoInput position y + 10.
    idMascotaInput := LabelWithTextFieldMorph new
	     label: 'ID de la mascota: ';
	     color: (Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: idMascotaInput .


    y := idMascotaInput position y + 30.
    botonAgendarTurno := BotonAccion new
	     mouseAction: [ self agendarTurno ];
        position: origen + (x@y);
        color:(Color fromHexString: '313668');
	     borderColor: Color black;
	     label: 'Agendar el turno';
        yourself.
    self addMorph: botonAgendarTurno .

    "4. Botón para cerrar la ventana"
    y := (botonAgendarTurno position y + 2).
    botonCerrar := BotonAccion new
	     mouseAction: [ self cerrar ];
  	     position: origen + (x@y);
	     color:(Color fromHexString: '313668');
	     borderColor: Color black;
	     label: 'Cerrar';
	    yourself.
    self addMorph: botonCerrar.

]

{ #category : 'propiosDelTipo' }
AtenderSolicitudTurnoVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
AtenderSolicitudTurnoVisual >> initialize [
    super initialize.
    self
        color: (Color fromHexString: '92d2bf');
        borderColor: Color black;
        borderWidth: 2;
        position: 45@45;
        bounds: (45@45 extent: 440@450).
	 origen := self innerBounds origin.
    self crearComponentes .
]

{ #category : 'method' }
AtenderSolicitudTurnoVisual >> validarDni [
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
AtenderSolicitudTurnoVisual >> validarFecha [
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
        self informar: 'Formato incorrecto. Use DD MM YYYY (ej: 01 08 2026)'.
        esValido := false
    ].
] ifFalse: [ esValido := false. ].

^esValido .
]

{ #category : 'method' }
AtenderSolicitudTurnoVisual >> validarHora [
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
		self informar: 'Debe seguir el formato 00:00'.
		valido := false.
	 ].
].

(valido) ifTrue: [ 
	horaObjeto := Time fromString: horaStrInput .
	 ].

^valido.
]

{ #category : 'method' }
AtenderSolicitudTurnoVisual >> validarId [
	| numero valido |
	valido := true.
	idMascotaInput contents isEmpty ifTrue: [
		self informar: 'Debe ingresar un Id.'.
		valido := false.
	].
	valido ifTrue: [ 
		idMascota := idMascotaInput contents.
		(idMascota allSatisfy: [ :c | c isDigit ]) ifFalse: [
		self informar: 'El Id debe contener únicamente números.'.
		valido := false.
		].
		valido ifTrue: [ 
			numero := idMascota asNumber.
			((numero > 0) and: [ numero < 100000000 ]) ifFalse: [
			self informar: 'El Id debe tener entre 1 y 8 dígitos.'.
			valido := false
			].
		].
	].
	^valido
]

{ #category : 'accessing' }
AtenderSolicitudTurnoVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria .
]
