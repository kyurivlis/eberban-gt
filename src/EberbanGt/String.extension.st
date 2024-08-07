Extension { #name : #String }

{ #category : #'*EberbanGt' }
String >> asPParsers [
	^ self deepCollect: [:x | x asPParser]
]

{ #category : #'*EberbanGt' }
String >> asPPchoice [
	^ self asPParsers fold: [:p1 :p2 | p1 / p2]
]
