Extension { #name : #String }

{ #category : #'*EberbanGt' }
String >> asPPChoice [
	^ self asPParsers fold: [:p1 :p2 | p1 / p2]
]

{ #category : #'*EberbanGt' }
String >> asPParsers [
	^ self deepCollect: [:x | x asPParser]
]
