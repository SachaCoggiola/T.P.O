"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestTPO',
	#superclass : 'PackageManifest',
	#category : 'T.P.O-Manifest',
	#package : 'T.P.O',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestTPO class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#RegistrarClienteVisual #initialize #false)) #'2026-08-03T00:50:59.795-03:00') #(#(#RGMethodDefinition #(#RegistrarDiagnosticoVisual #initialize #false)) #'2026-08-03T00:57:34.693-03:00') #(#(#RGMethodDefinition #(#AsignarTratamientoVisual #initialize #false)) #'2026-08-03T01:37:29.944-03:00') )
]
