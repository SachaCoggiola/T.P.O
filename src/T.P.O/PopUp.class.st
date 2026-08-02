Class {
	#name : 'PopUp',
	#superclass : 'SystemWindow',
	#instVars : [
		'texto',
		'botonCerrar'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'propiosDelTipo' }
PopUp class >> mostrar: unTexto [
    | ventana |
    ventana := self new.
    ventana mensaje: unTexto.
    ventana openInWorld.
]

{ #category : 'initialization' }
PopUp >> initialize [
    super initialize.
    self setLabel: 'Mensaje'; color: Color veryLightGray; extent: 420@220.

    texto := RubScrolledTextMorph new.
    texto position: 15@15; extent: 390@140.
    texto textArea beReadOnly; contents: ''.
    self addMorph: texto.

    botonCerrar := BotonAccion new.
    botonCerrar label: 'Cerrar'; position: 160@170; mouseAction: [ self delete ].
    self addMorph: botonCerrar.
]

{ #category : 'propiosDelTipo' }
PopUp >> mensaje: unTexto [
    texto textArea contents: unTexto.
]
