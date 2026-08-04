Class {
	#name : 'VeterinariaVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'registrarCliente',
		'listarTurnosFecha',
		'registrarMascota',
		'registrarDiagnostico',
		'registrarTratamiento',
		'registrarPago',
		'facturarDiagnostico',
		'inicializarSistema',
		'facturar',
		'botonCerrar',
		'etiqueta',
		'origen'
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

{ #category : 'propiosDelTipo' }
VeterinariaVisual >> cerrar [
	"self submorphs do: [ :cadaSubmorph | cadaSubmorph delete ]."
	self delete
]

{ #category : 'accessing' }
VeterinariaVisual >> facturarDiagnostico [
	|ventana|
	
	ventana := FacturarDiagnostico new.
	ventana veterinaria: veterinaria.
	ventana openInWorld.
]

{ #category : 'propiosDelTipo' }
VeterinariaVisual >> informar: unTexto [
	PopUp mostrar: unTexto.
]

{ #category : 'initialization' }
VeterinariaVisual >> initialize [ 
	super initialize.
	self color: (Color fromHexString: '024a86').
	self position: 45@45.
	self bounds: (45@45 extent: 400@500).
	
	registrarCliente := BotonAccion new.
	self addMorph: registrarCliente.
	origen := self innerBounds origin.
	registrarCliente position: origen + (30@40).
	registrarCliente label: 'Registrar un nuevo cliente'.
	
	registrarMascota := BotonAccion new.
	self addMorph: registrarMascota.
	registrarMascota position: registrarCliente position + (0@40).
	registrarMascota label: 'Registrar una nueva mascota'.
	
	registrarDiagnostico := BotonAccion new.
	self addMorph: registrarDiagnostico.
	registrarDiagnostico position: registrarMascota position + (0@40).
	registrarDiagnostico label: 'Registrar un nuevo diagnostico'.

	registrarTratamiento := BotonAccion new.
	self addMorph: registrarTratamiento.
	registrarTratamiento position: registrarDiagnostico position + (0@40).
	registrarTratamiento label: 'Registrar un nuevo Tratamiento'.
	
	registrarPago := BotonAccion new.
	self addMorph: registrarPago.
	registrarPago position: registrarTratamiento position + (0@40).
	registrarPago label: 'Registrar un nuevo Pago'.

	facturar := BotonAccion new.
	self addMorph: facturar.
	facturar position: registrarPago position + (0@40).
	facturar label: 'Facturar un diagnostico'.
	
	listarTurnosFecha := BotonAccion new.
	self addMorph: listarTurnosFecha .
	listarTurnosFecha position: facturar position + (0@40).
   listarTurnosFecha label: 'Listar los turnos de una fecha ingresada'.

	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [ self cerrar ].
	botonCerrar position: (330@480).
	botonCerrar label: 'Cerrar'.
	
	self update: veterinaria.
	
	registrarCliente mouseAction: [ self registrarCliente ].
	registrarMascota mouseAction: [ self registrarMascota ].
	registrarDiagnostico mouseAction: [ self registrarDiagnostico ].
	registrarTratamiento mouseAction: [ self registrarTratamiento ].
	registrarPago mouseAction: [ self registrarPago ].
	facturar mouseAction: [ self facturarDiagnostico ].
	listarTurnosFecha mouseAction: [ self listarTurnosFecha ].
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

{ #category : 'propiosDelTipo' }
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
