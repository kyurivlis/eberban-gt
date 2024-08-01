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
	self parse: i rule: #compound.
]

{ #category : #accessing }
EbGrammarExamples >> mian [
	<gtExample>
	self parse: 'mian' rule: #word
]

{ #category : #accessing }
EbGrammarExamples >> parserClass [
	^ EbGrammar
]
