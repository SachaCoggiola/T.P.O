Class {
	#name : 'AtenderSolicitudTurnoVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'clasifTurno',
		'fechaInput',
		'fechaObjeto',
		'dniMedicoInput',
		'medico',
		'idMascotaInput',
		'mascota',
		'horaStrInput',
		'horaObjeto',
		'veterinaria',
		'turnoObjeto',
		'origen',
		'botonCerrar',
		'botonAgendarTurno',
		'cliente',
		'dniClienteInput',
		'botonConsulta',
		'botonTrat',
		'motivoInput',
		'tipoAtencionInput'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'method' }
AtenderSolicitudTurnoVisual >> buscarCliente [
	|contenido valido|
	contenido := dniClienteInput contents.
	valido := false.
	( contenido trimBoth isEmpty ) ifFalse: [
		(contenido allSatisfy: [ :c | c isDigit ]) ifFalse: [
			self informar: 'El DNI debe contener únicamente números.'.
		] ifTrue: [
			cliente := veterinaria buscarClienteConDni: contenido asNumber.
			cliente ifNil: [ self informar: 'No se ha encontrado un cliente con el DNI ingresado' ]
			 ifNotNil: [               
				self informar: 'Cliente encontrado'.
				valido := true. ] .
		].
	] ifTrue: [ self informar: 'Ingrese el DNI de un cliente' ].
^valido.
]

{ #category : 'propiosDelTipo' }
AtenderSolicitudTurnoVisual >> buscarMascota [
	|contenido valido|
	contenido := idMascotaInput contents. 
	valido := false.
	( contenido trimBoth isEmpty ) ifFalse: [
		(contenido allSatisfy: [ :c | c isDigit ]) ifFalse: [
			self informar: 'El ID debe contener únicamente números.'.
		] ifTrue: [
		   cliente ifNotNil: [ 
			mascota := cliente buscarMascotaConId: contenido asNumber.
			mascota ifNil: [ self informar: 'No se ha encontrado una mascota con el ID ingresado.' ]
			 ifNotNil: [ self informar: 'Mascota encontrada'.
			           	valido := true. ] .
			 ] ifNil: 
		   [ self informar: 'No existe el cliente con la mascota']
		].
	] ifTrue: [ self informar: 'Ingrese el ID de una mascota' ].
^valido.
]

{ #category : 'method' }
AtenderSolicitudTurnoVisual >> buscarMedico [
	|contenido valido|
	contenido := dniMedicoInput contents. 
	valido := false.
	( contenido trimBoth isEmpty ) ifFalse: [
		(contenido allSatisfy: [ :c | c isDigit ]) ifFalse: [
			self informar: 'El DNI debe contener únicamente números.'.
		] ifTrue: [
			medico := veterinaria buscarMedicoConDni: contenido asNumber.
			medico ifNil: [ self informar: 'No se ha encontrado un medico con el DNI ingresado' ]
			 ifNotNil: [ self informar: 'Medico encontrado'.
				valido := true. ] .
		].
	] ifTrue: [ self informar: 'Ingrese el DNI de un medico' ].
^valido.
]

{ #category : 'propiosDelTipo' }
AtenderSolicitudTurnoVisual >> cerrar [ 
self delete.
]

{ #category : 'initialization' }
AtenderSolicitudTurnoVisual >> crearComponentes [
    | x y etiqueta1 |

    origen := self innerBounds origin.

    x := 10.
    y := 15.

    botonTrat delete.
    botonConsulta delete.

    etiqueta1 := LabelMorph new
        contents: 'Ingrese los datos necesarios, fecha con formato (DD MM YYYY), hora (00:00)';
        color: Color black;
        yourself.
    etiqueta1 position: origen + (x@y).
    self addMorph: etiqueta1.

    y := etiqueta1 position y + 30.
    fechaInput := LabelWithTextFieldMorph new
	     label: 'Fecha: ';
	     color: (Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: fechaInput.

    dniClienteInput := LabelWithTextFieldMorph new
	     label: 'DNI del cliente: ';
	     color: (Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + ((fechaInput position x + 230)@y).
    self addMorph: dniClienteInput .

    y := fechaInput position y + 30.
    horaStrInput := LabelWithTextFieldMorph new
	     label: 'Hora: ';
	     color:(Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: horaStrInput .

    motivoInput := LabelWithTextFieldMorph new
	     label: 'Motivo: ';
	     color:(Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + ((horaStrInput position x + 230)@y).
    self addMorph: motivoInput .
    
    y := horaStrInput position y + 30.
    dniMedicoInput := LabelWithTextFieldMorph new
	     label: 'DNI del Médico: ';
	     color: (Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: dniMedicoInput .

    (clasifTurno = 'C') ifTrue: [ 
    tipoAtencionInput := LabelWithTextFieldMorph new
	     label: 'Tipo Atención: ';
	     color:(Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + ((dniMedicoInput position x + 230)@y).
    self addMorph: tipoAtencionInput .
	 ].

     y := dniMedicoInput position y + 30.
    idMascotaInput := LabelWithTextFieldMorph new
	     label: 'ID de la mascota: ';
	     color: (Color fromHexString: '313668');
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: idMascotaInput .

    y := y + 90.
    botonAgendarTurno := BotonAccion new
	     mouseAction: [ self registrarTurno ];
        position: origen + (x@y);
        color:(Color fromHexString: '313668');
	     borderColor: Color black;
	     label: 'Registrar el turno';
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
        bounds: (45@45 extent: 550@630).
	 origen := self innerBounds origin.
	
	 botonConsulta := BotonAccion new.
	self addMorph: botonConsulta .
	botonConsulta color: (Color fromHexString: '#313668');
   borderColor: Color black.
	botonConsulta mouseAction: [ clasifTurno := 'C' .
		self crearComponentes .].	
	botonConsulta position: (50@210).
	botonConsulta label: 'Registrar turno de consulta'.
	
	botonTrat := BotonAccion new.
	self addMorph: botonTrat .
	botonTrat mouseAction: [ clasifTurno := 'T'.
		self crearComponentes . ].	
   botonTrat color: (Color fromHexString: '#313668');
   borderColor: Color black.
	botonTrat position: (290@210).
	botonTrat label: 'Registrar turno de tratamiento'.
	
]

{ #category : 'method' }
AtenderSolicitudTurnoVisual >> registrarTurno [ 
| fueAgendado motivo tipoAtencion tratamiento|

(self validarFecha) ifTrue: [  
	(self validarHora) ifTrue: [ 
      (self buscarMedico) ifTrue: [  
	     (self buscarCliente) ifTrue: [  
       	(self buscarMascota) ifTrue: [  
 	        motivo := motivoInput asString trimBoth.
	       (motivo) ifNotEmpty: [  
	
	     (clasifTurno = 'T') ifTrue: [
		 (tratamiento := veterinaria buscarTratamientoConFecha: fechaObjeto yMotivo: motivo) ifNotNil: [
			turnoObjeto := TurnoTratamiento crearConFecha: fechaObjeto yHora: horaObjeto yMotivo: motivo yCliente: cliente yMascota: mascota yMedico: medico yTratamiento: tratamiento. 
			 ] ifNil: [ self informar: 'No hay tratamiento registrado para este turno.' ].
		 ] 
	ifFalse: [ 
		tipoAtencion := tipoAtencionInput asString trimBoth.
		(tipoAtencion) ifNotEmpty: [ 
		turnoObjeto := TurnoConsulta crearConFecha: fechaObjeto yHora: horaObjeto yMotivo: motivo yCliente: cliente yMascota: mascota yMedico: medico yTipoAtencion: tipoAtencion.
		] ifEmpty: [ 
		self informar: 'Debe ingresar un tipo de atención.'.
		 ]
		].

        (turnoObjeto) ifNotNil: [  
          fueAgendado := veterinaria agendarTurno: turnoObjeto .

          (fueAgendado) ifTrue: [ 
	         self informar: 'El turno ', turnoObjeto toString, ' fue agendado.', String cr.
	       ] ifFalse: [ 
	         self informar: 'El turno ', turnoObjeto toString, ' no se pudo agendar.', String cr.
	       ].
 
        ] ifNil: [ self informar: 'No existe el turno ingresado' ]

     ] ifEmpty: [ 
self informar: 'Tiene que tener un motivo'.
 ].
].
      ].
   ].
].  
].
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

{ #category : 'accessing' }
AtenderSolicitudTurnoVisual >> veterinaria: unaVeterinaria [
^veterinaria := unaVeterinaria .
]
