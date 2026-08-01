Class {
	#name : 'VeterinariaVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'registrarCliente',
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
	veterinaria addDependent: self.
	self update: veterinaria.
	registrarCliente mouseAction: [ self registrarCliente ].
]

{ #category : 'accessing' }
VeterinariaVisual >> registrarCliente [
    | ventana |

    ventana := RegistrarClienteVisual new.
    ventana veterinaria: veterinaria.
    ventana openInWorld.
]
