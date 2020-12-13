Class {
	#name : #BaselineOfContainersRunArray,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersRunArray
}

{ #category : #baselines }
BaselineOfContainersRunArray >> baseline: spec [
	<baseline>

	spec for: #pharo do: [		
		spec 
			package: 'Containers-RunArray'.
		spec
				package: 'Containers-RunArray-Tests'
				with: [ spec requires: #('Containers-RunArray') ].
		]
]
