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
		'botonCerrar',
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

{ #category : 'initialization' }
VeterinariaVisual >> initialize [ 
	super initialize.
	self color: Color darkGray.
	self position: 45@45.
	self bounds: (45@45 extent: 350@420).
	
	registrarCliente := BotonAccion new.
	self addMorph: registrarCliente.
	origen := self innerBounds origin.
	registrarCliente position: origen + (10@10).
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
	
	listarTurnosFecha := BotonAccion new.
	self addMorph: listarTurnosFecha .
	listarTurnosFecha position: registrarTratamiento position + (0@40).
   listarTurnosFecha label: 'Listar los turnos de una fecha ingresada'.

	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [ self cerrar ].
	botonCerrar position: (330@400).
	botonCerrar label: 'Cerrar'.
	
	self update: veterinaria.
	
	registrarCliente mouseAction: [ self registrarCliente ].
	registrarMascota mouseAction: [ self registrarMascota ].
	registrarDiagnostico mouseAction: [ self registrarDiagnostico ].
	registrarTratamiento mouseAction: [ self registrarTratamiento ].
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
VeterinariaVisual >> registrarTratamiento [
	|ventana|
	ventana := AsignarTratamientoVisual new.
	ventana veterinaria: veterinaria.
	ventana openInWorld.
]

{ #category : 'accessing' }
VeterinariaVisual >> veterinaria: unaVet [
	veterinaria := unaVet
]
