Class {
	#name : #EbDictionary,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : #EberbanGt
}

{ #category : #example }
EbDictionary class >> example [
	<gtExample>
	^self fromPath: (Path from: '/home/qeqpep/s/s/eberban-gt/eberban/dictionary/en.yaml')
]

{ #category : #'instace creation' }
EbDictionary class >> fromPath: aPath [
	 ^self new initialize: (STON fromString: (YAMLParser parse: aPath asFileReference contents) asJsonString)
]

{ #category : #parsing }
EbDictionary class >> parse: aString [
	aString ifNotNil: [^self parserClass new parse: aString]
]

{ #category : #parsing }
EbDictionary class >> parserClass [
	^EbDictionaryParser
]

{ #category : #accessing }
EbDictionary >> entries [
	^entries
]

{ #category : #initialialize }
EbDictionary >> gloss: anObject [ 
]

{ #category : #initialialize }
EbDictionary >> initialize: rawDict [
	entries:= self orderedDict: rawDict.
]

{ #category : #initialialize }
EbDictionary >> orderedDict: rawDict [ 
	|aKeys aDict |
	rawDict removeKey: '_spelling'.
	aDict:= OrderedCollection new.
	aKeys:= self validKeys: rawDict.
	rawDict keysAndValuesDo: [:k :v| |entry|
		entry:=(OrderedDictionary new: aKeys size).
		entry at: #word put: k.
		aKeys do: [:ke| entry at: ke put: 
						(v at: ke ifPresent: [:va|
							ke = #links ifTrue: [self parseLinks: va].
							ke = #gloss ifTrue: [va trimRight: [:x| x = $:]]
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
