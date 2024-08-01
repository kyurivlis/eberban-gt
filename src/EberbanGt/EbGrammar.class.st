Class {
	#name : #EbGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'text',
		'sonorant',
		'vhowel',
		'consonant',
		'surd',
		'letter',
		'vowel',
		'word',
		'compound',
		'compoundPrefix'
	],
	#category : #EberbanGt
}

{ #category : #accessing }
EbGrammar >> compound [
	^(compoundPrefix ==> [:nodes| nodes ]), letter star end
]

{ #category : #accessing }
EbGrammar >> compoundPrefix [
	^'e' asPParser
]

{ #category : #accessing }
EbGrammar >> consonant [
	^sonorant / surd
]

{ #category : #accessing }
EbGrammar >> letter [
	^consonant/ vhowel
]

{ #category : #accessing }
EbGrammar >> sonorant [
	^'nrl' asPPchoice
]

{ #category : #accessing }
EbGrammar >> start [
	^word
]

{ #category : #accessing }
EbGrammar >> surd [
	^'mpbfvtdszcjgk' asPPchoice
]

{ #category : #accessing }
EbGrammar >> text [
	^letter
]

{ #category : #accessing }
EbGrammar >> vhowel [
	^vowel / $h asPParser
]

{ #category : #accessing }
EbGrammar >> vowel [
	^'ieaou' asPPchoice
]

{ #category : #accessing }
EbGrammar >> word [
	^letter star
]
