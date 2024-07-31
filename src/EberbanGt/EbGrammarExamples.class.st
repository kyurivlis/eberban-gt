Class {
	#name : #EbGrammarExamples,
	#superclass : #PP2CompositeNodeExamples,
	#instVars : [
		'i'
	],
	#category : #EberbanGt
}

{ #category : #accessing }
EbGrammarExamples >> eberban [
	<gtExample>
	i := 'Eberban'.
	self parse: i rule: #sentence.
]

{ #category : #accessing }
EbGrammarExamples >> parserClass [
	^ EbGrammar
]
