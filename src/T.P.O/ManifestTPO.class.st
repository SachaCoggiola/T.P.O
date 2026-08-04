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
ManifestTPO class >> ruleGuardingClauseRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'T.P.O')) #'2026-08-03T16:54:30.223-03:00') )
]

{ #category : 'code-critics' }
ManifestTPO class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#RegistrarClienteVisual #initialize #false)) #'2026-08-03T00:50:59.795-03:00') #(#(#RGMethodDefinition #(#RegistrarDiagnosticoVisual #initialize #false)) #'2026-08-03T00:57:34.693-03:00') #(#(#RGMethodDefinition #(#AsignarTratamientoVisual #initialize #false)) #'2026-08-03T01:37:29.944-03:00') #(#(#RGMethodDefinition #(#RegistrarFarmacologicoVisual #initialize #false)) #'2026-08-03T15:48:36.146-03:00') #(#(#RGMethodDefinition #(#VeterinariaVisual #initialize #false)) #'2026-08-03T15:52:51.805-03:00') #(#(#RGMethodDefinition #(#RegistrarMascotaVisual #initialize #false)) #'2026-08-03T16:10:42.617-03:00') #(#(#RGMethodDefinition #(#RegistrarMascotaVisual #registrar #false)) #'2026-08-03T16:24:44.994-03:00') #(#(#RGMethodDefinition #(#RegistrarQuirurgicoVisual #initialize #false)) #'2026-08-03T17:23:16.076-03:00') #(#(#RGMethodDefinition #(#RegistrarPagoVisual #initialize #false)) #'2026-08-03T20:27:37.697-03:00') #(#(#RGMethodDefinition #(#RegistrarPagoVisual #buscarFactura #false)) #'2026-08-03T21:19:24.768-03:00') #(#(#RGMethodDefinition #(#FacturarDiagnostico #initialize #false)) #'2026-08-03T21:48:28.938-03:00') )
]

{ #category : 'code-critics' }
ManifestTPO class >> ruleReGuardClauseRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'T.P.O')) #'2026-08-03T16:54:42.322-03:00') )
]
