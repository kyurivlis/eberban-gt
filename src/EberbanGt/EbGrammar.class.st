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
		'vowel'
	],
	#category : #EberbanGt
}

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
	^'nrl' asPPChoice
]

{ #category : #accessing }
EbGrammar >> start [
	^letter
]

{ #category : #accessing }
EbGrammar >> surd [
	^'mpbfvtdszcjgk' asPPChoice
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
	^'ieaou' asPPChoice
]

{ #category : #accessing }
EbGrammar >> word [
	^letter star
]
