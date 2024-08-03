Class {
	#name : #EbGrammarExamples,
	#superclass : #PP2CompositeNodeExamples,
	#instVars : [
		'i',
		'p'
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
EbGrammarExamples >> mianmiunmeon [
	<gtExample>
	i:='mianmiunmeon'.
	p:= self parse: i rule: #sentence.
	self assert: p words size equals: 3.
	self assert: p 
]

{ #category : #accessing }
EbGrammarExamples >> parserClass [
	^ EbGrammar
]
