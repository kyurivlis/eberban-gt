Class {
	#name : #EbDictionary,
	#superclass : #Object,
	#instVars : [
		'dict'
	],
	#category : #EberbanGt
}

{ #category : #example }
EbDictionary class >> example [
	<gtExample>
	^self fromPath: (Path / 'C:' / 'Users' / 'nastya' / 'eberban-gt' / 'eberban' / 'dictionary' / 'en.yaml')
]

{ #category : #'instace creation' }
EbDictionary class >> fromPath: aPath [
	 ^self new initialize: (STON fromString: (YAMLParser parse: aPath asFileReference contents) asJsonString)
]

{ #category : #accessing }
EbDictionary >> dict [
	^dict
]

{ #category : #initialialize }
EbDictionary >> gloss: anObject [ 
]

{ #category : #initialialize }
EbDictionary >> initialize: rawDict [
	dict:= self orderedDict: rawDict.
]

{ #category : #initialialize }
EbDictionary >> orderedDict: rawDict [ 
	|aKeys aDict |
	aDict:= OrderedCollection new.
	aKeys:= self validKeys: rawDict.
	rawDict keysAndValuesDo: [:k :v| |entry|
		entry:=(OrderedDictionary new: aKeys size).
		entry at: #word put: k.
		aKeys do: [:ke| entry at: ke put: 
						(v at: ke ifPresent: [:va|
							ke = #links ifTrue: [self parseLinks: va]
							ifFalse: [va]] ifAbsent: nil)].
		aDict add: entry].
	^aDict
]

{ #category : #initialialize }
EbDictionary >> parseLinks: anArray [ 
	^anArray collect: [:l| '[', (l at: 2), '](', (l at:3), ')']
]

{ #category : #initialialize }
EbDictionary >> validKeys: rawDict [
	| aKeys |
	aKeys:= Bag new.
	rawDict valuesDo: [:v | v keysDo: [:k | aKeys add: k]].
	^(aKeys cumulativeCounts takeFirst: 9) collect: [:a| a value asSymbol]
]
