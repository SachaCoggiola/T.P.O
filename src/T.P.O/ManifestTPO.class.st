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
	^ #(#(#(#RGMethodDefinition #(#RegistrarClienteVisual #initialize #false)) #'2026-08-02T14:38:00.734-03:00') #(#(#RGMethodDefinition #(#VeterinariaVisual #initialize #false)) #'2026-08-02T19:08:23.452-03:00') #(#(#RGMethodDefinition #(#RegistrarMascotaVisual #initialize #false)) #'2026-08-02T19:31:59.325-03:00') #(#(#RGMethodDefinition #(#RegistrarMascotaVisual #registrar #false)) #'2026-08-02T19:43:53.045-03:00') )
]
