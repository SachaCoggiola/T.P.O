Class {
	#name : 'VeterinariaVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'registrarCliente',
		'listarTurnosFecha',
		'origen'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'initialization' }
VeterinariaVisual >> initialize [ 
	super initialize.
	veterinaria := Veterinaria new.
	self color: Color darkGray.
	self position: 45@45.
	self bounds: (45@45 extent: 350@420).
	
	registrarCliente := BotonAccion new.
	self addMorph: registrarCliente.
	origen := self innerBounds origin.
	registrarCliente position: origen + (10@10).
	registrarCliente label: 'Registrar un nuevo cliente'.
	
	listarTurnosFecha := BotonAccion new.
	self addMorph: listarTurnosFecha .
	origen := self innerBounds origin.
	listarTurnosFecha position: origen + (10@40).
   listarTurnosFecha label: 'Listar los turnos de una fecha ingresada'.
	
	veterinaria addDependent: self.
	self update: veterinaria.
	
	registrarCliente mouseAction: [ self registrarCliente ].
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
