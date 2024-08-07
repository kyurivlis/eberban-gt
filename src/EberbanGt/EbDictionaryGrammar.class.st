Class {
	#name : #EbDictionaryGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'text',
		'literal',
		'argument',
		'argName',
		'argType',
		'word',
		'link',
		'separator'
	],
	#category : #EberbanGt
}

{ #category : #accessing }
EbDictionaryGrammar >> argName [
	^ #letter asPParser
]

{ #category : #accessing }
EbDictionaryGrammar >> argType [
	^ $] asPParser negate star
]

{ #category : #accessing }
EbDictionaryGrammar >> argument [
	^ $[ asPParser, argName, $: asPParser, argType, $] asPParser
]

{ #category : #accessing }
EbDictionaryGrammar >> link [
	^${ asPParser, #word asPParser star, $} asPParser
]

{ #category : #accessing }
EbDictionaryGrammar >> literal [
	^ PP2Node 
]

{ #category : #accessing }
EbDictionaryGrammar >> separator [
	^ #space asPParser / #newline asPParser
]

{ #category : #accessing }
EbDictionaryGrammar >> start [
	^text
]

{ #category : #accessing }
EbDictionaryGrammar >> text [
	^(argument / link / word / separator) star
]

{ #category : #accessing }
EbDictionaryGrammar >> word [
	^ #word asPParser 
]
