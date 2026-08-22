Class {
	#name : 'VeterinariaVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'botonInicializar',
		'registrarCliente',
		'listarTurnosFecha',
		'registrarMascota',
		'registrarDiagnostico',
		'registrarTratamiento',
		'registrarPago',
		'facturar',
		'botonCerrar',
		'etiqueta',
		'origen',
		'listarTratamientosMedico',
		'historialTurnos',
		'historialClinicoDe',
		'facturasPendientes',
		'cancelarTurno',
		'atenderSolicitudTurno',
		'botonVentanaDatos'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'as yet unclassified' }
VeterinariaVisual class >> abrirMenuVet: unaVet [
	|window|
	window := self new.
	window veterinaria: unaVet.
	unaVet addDependent: window.
	window openInWorld.
	^window 
]

{ #category : 'accessing' }
VeterinariaVisual >> atenderSolicitudTurno [
 | ventana |

    ventana := AtenderSolicitudTurnoVisual new.
    ventana veterinaria: veterinaria.
    ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> botonDatos [
| ventana |

    ventana := VentanaDatosVisual new
    initialize: veterinaria .
    ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> cancelarTurnoPendiente [
 | ventana |

    ventana := CancelarTurnoPendienteVisual new.
    ventana veterinaria: veterinaria.
    ventana openInWorld.
]

{ #category : 'propiosDelTipo' }
VeterinariaVisual >> cerrar [
	"self submorphs do: [ :cadaSubmorph | cadaSubmorph delete ]."
	self delete
]

{ #category : 'initialization' }
VeterinariaVisual >> crearComponentes [

   origen := self innerBounds origin.

   botonVentanaDatos := BotonAccion new
   color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: botonVentanaDatos.
	botonVentanaDatos position: origen + (30@40).
	botonVentanaDatos label: 'Mostrar datos de clientes y mascotas'.

   registrarCliente := BotonAccion new
   color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: registrarCliente.
	registrarCliente position: botonVentanaDatos position + (0@40).
	registrarCliente label: 'Registrar un nuevo cliente'.
	
	registrarMascota := BotonAccion new
	color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: registrarMascota.
	registrarMascota position: registrarCliente position + (0@40).
	registrarMascota label: 'Registrar una nueva mascota'.
	
	registrarDiagnostico := BotonAccion new
	color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: registrarDiagnostico.
	registrarDiagnostico position: registrarMascota position + (0@40).
	registrarDiagnostico label: 'Registrar un nuevo diagnostico'.

	registrarTratamiento := BotonAccion new
	color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: registrarTratamiento.
	registrarTratamiento position: registrarDiagnostico position + (0@40).
	registrarTratamiento label: 'Registrar un nuevo Tratamiento'.
	
	registrarPago := BotonAccion new
	color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: registrarPago.
	registrarPago position: registrarTratamiento position + (0@40).
	registrarPago label: 'Registrar un nuevo Pago'.

	facturar := BotonAccion new
	color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: facturar.
	facturar position: registrarPago position + (0@40).
	facturar label: 'Facturar un diagnostico'.
	
	listarTurnosFecha := BotonAccion new
	color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: listarTurnosFecha .
	listarTurnosFecha position: facturar position + (0@40).
   listarTurnosFecha label: 'Listar los turnos de una fecha ingresada'.

   listarTratamientosMedico := BotonAccion new
   color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: listarTratamientosMedico .
	listarTratamientosMedico position: listarTurnosFecha position + (0@40).
   listarTratamientosMedico label: 'Listar los tratamientos de un médico ingresado'.

   historialTurnos := BotonAccion new
   color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: historialTurnos .
	historialTurnos position: listarTratamientosMedico position + (0@40).
   historialTurnos label: 'Listar el historial de turnos de un cliente'.

   historialClinicoDe := BotonAccion new
   color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: historialClinicoDe .
	historialClinicoDe position: historialTurnos position + (0@40).
   historialClinicoDe label: 'Listar el historial clinico de una mascota'.

   facturasPendientes := BotonAccion new
   color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: facturasPendientes .
	facturasPendientes position: historialClinicoDe position + (0@40).
   facturasPendientes label: 'Listar las facturas pendientes de un cliente'.

   cancelarTurno := BotonAccion new
   color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: cancelarTurno .
	cancelarTurno position: facturasPendientes position + (0@40).
   cancelarTurno label: 'Cancelar un turno pendiente'.

   atenderSolicitudTurno := BotonAccion new
   color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: atenderSolicitudTurno .
	atenderSolicitudTurno position: cancelarTurno position + (0@40).
   atenderSolicitudTurno label: 'Atender la solicitud de un turno'.
   
   botonVentanaDatos mouseAction: [ self botonDatos ].
	registrarCliente mouseAction: [ self registrarCliente ].
	registrarMascota mouseAction: [ self registrarMascota ].
	registrarDiagnostico mouseAction: [ self registrarDiagnostico ].
	registrarTratamiento mouseAction: [ self registrarTratamiento ].
	registrarPago mouseAction: [ self registrarPago ].
	facturar mouseAction: [ self facturarDiagnostico ].
	listarTurnosFecha mouseAction: [ self listarTurnosFecha ].
	listarTratamientosMedico mouseAction: [ self listarTratamientosMedico ].
	historialTurnos mouseAction: [ self historialTurnosDe ].
	historialClinicoDe mouseAction: [ self historialClinicoDe ].
	facturasPendientes mouseAction: [ self facturasPendientesCliente ].
	cancelarTurno mouseAction: [ self cancelarTurnoPendiente ].
	atenderSolicitudTurno mouseAction: [ self atenderSolicitudTurno ]. 
]

{ #category : 'accessing' }
VeterinariaVisual >> facturarDiagnostico [
	|ventana|
	
	ventana := FacturarDiagnostico new.
	ventana veterinaria: veterinaria.
	ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> facturasPendientesCliente [
 | ventana |

    ventana := FacturasPendientesClienteVisual new.
    ventana veterinaria: veterinaria.
    ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> historialClinicoDe [
 | ventana |

    ventana := HistorialClinicoDeVisual new.
    ventana veterinaria: veterinaria.
    ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> historialTurnosDe [
 | ventana |

    ventana := HistorialTurnosDeVisual new.
    ventana veterinaria: veterinaria.
    ventana openInWorld.
]

{ #category : 'propiosDelTipo' }
VeterinariaVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
VeterinariaVisual >> initialize [ 
   |inicializado|
   inicializado := false.

	super initialize.
	self color: (Color fromHexString: '92d2bf').
	self position: 45@45.
	self bounds: (45@45 extent: 400@650).
	
	origen := self innerBounds origin.
	
	botonInicializar := BotonAccion new.
	self addMorph: botonInicializar .
	botonInicializar color: (Color fromHexString: '#313668');
   borderColor: Color black.
	botonInicializar position: origen + (30@40).
	botonInicializar label: 'Inicializar el Sistema'.

   botonCerrar := BotonAccion new
   color: (Color fromHexString: '#313668');
   borderColor: Color black.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [ self cerrar ].
	botonCerrar position: (330@640).
	botonCerrar label: 'Cerrar'.
	
	botonInicializar mouseAction: [
		 veterinaria inicializarSistema .
		 self crearComponentes ].
	
	self update: veterinaria.
	
	
]

{ #category : 'accessing' }
VeterinariaVisual >> listarTratamientosMedico [
 | ventana |

    ventana := ListarTratamientosMedicoVisual new.
    ventana veterinaria: veterinaria.
    ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> listarTurnosFecha [
 | ventana |

    ventana := ListarTurnosFechaInterfaz new.
    ventana veterinaria: veterinaria.
    ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> registrarCliente [
    | ventana |

    ventana := RegistrarClienteVisual new.
    ventana veterinaria: veterinaria.
    ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> registrarDiagnostico [
	|ventana|
	ventana := RegistrarDiagnosticoVisual new.
	ventana veterinaria: veterinaria.
	ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> registrarMascota [
	| ventana |

    ventana := RegistrarMascotaVisual new.
    ventana veterinaria: veterinaria.
    ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> registrarPago [
	|ventana|
	ventana := RegistrarPagoVisual new.
	ventana veterinaria: veterinaria.
	ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> registrarTratamiento [
	|ventana|
	ventana := AsignarTratamientoVisual new.
	ventana veterinaria: veterinaria.
	ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> veterinaria: unaVet [
	veterinaria := unaVet.
	etiqueta := LabelMorph new.
	self addMorph: etiqueta.
	etiqueta contents: veterinaria getNombre.
	etiqueta position: origen + (10@10).
	etiqueta color: Color black .
]
