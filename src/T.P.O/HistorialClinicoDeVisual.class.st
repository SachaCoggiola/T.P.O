Class {
	#name : 'HistorialClinicoDeVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'mascotaInput',
		'resultadoMorph',
		'veterinaria',
		'mascotaObjeto',
		'origen',
		'botonHistorialClinico'
	],
	#category : 'T.P.O',
	#package : 'T.P.O'
}

{ #category : 'initialization' }
HistorialClinicoDeVisual >> crearComponentes [
    | x y etiqueta |

    x := 5.
    y := 15.

    etiqueta := LabelMorph new
        contents: 'Ingrese la Mascota:';
        color: Color black;
        yourself.
    etiqueta position: origen + (x@y).
    self addMorph: etiqueta.

    y := y + 30.
    mascotaInput := LabelWithTextFieldMorph new
	     label: 'Mascota: ';
	     color: Color lightBlue;
        borderWidth: 1;
	     position: origen + (x@y).
    self addMorph: mascotaInput .

    "3. Botón para listar los turnos luego de ingresar la fecha"
    y := mascotaInput position y + 30.
    botonHistorialClinico := BotonAccion new
	     mouseAction: [ self historialClinico ];
        position: origen + (x@y);
	     label: 'Listar turnos con esta fecha';
        yourself.
    self addMorph: botonHistorialClinico .

    "4. Mostrar resultados (StringMorph)"
    y := y + 40.
    resultadoMorph := StringMorph new
        contents: '';
        color: Color blue;
        position: origen + (x@y);
        yourself.
    self addMorph: resultadoMorph.

]

{ #category : 'method' }
HistorialClinicoDeVisual >> historialClinico [

]

{ #category : 'initialization' }
HistorialClinicoDeVisual >> initialize [
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

{ #category : 'accessing' }
HistorialClinicoDeVisual >> veterinaria: unaVeterinaria [
veterinaria := unaVeterinaria .
]
