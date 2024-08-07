Class {
	#name : #EbDictionaryGrammarExamples,
	#superclass : #PP2CompositeNodeExamples,
	#instVars : [
		'i'
	],
	#category : #EberbanGt
}

{ #category : #accessing }
EbDictionaryGrammarExamples >> argument [
	<gtExample>
	^self parse: '[E: tca man]' rule:#argument
]

{ #category : #accessing }
EbDictionaryGrammarExamples >> lineBreaks [
	<gtExample>
	^self parse: 'Im a nasty line with
	breaks'.
]

{ #category : #accessing }
EbDictionaryGrammarExamples >> link [
	<gtExample>
	^self parse: '{mian}' rule: #link
]

{ #category : #accessing }
EbDictionaryGrammarExamples >> parserClass [
	^EbDictionaryGrammar
]

{ #category : #accessing }
EbDictionaryGrammarExamples >> sampleText [
	<gtExample>
	^self parse: '{mian} you can use [E: tce* pan]' rule: #text
]
