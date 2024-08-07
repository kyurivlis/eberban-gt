Class {
	#name : #EbDictionaryParser,
	#superclass : #EbDictionaryGrammar,
	#category : #EberbanGt
}

{ #category : #accessing }
EbDictionaryParser >> argument [
	^super argument ==> [:n|
		String streamContents: [:s | (XMLWriter on: s) lineBreak: '<br>'; writeWith: [:w|
		w tag: #span attributes: {#class -> #arg} with: 
			[w tag: #span attributes: {#class -> #argLetter} with: (n at: 2);
			tag: #span attributes: {#class -> #argType} with: (n at:4)]]]]
]

{ #category : #accessing }
EbDictionaryParser >> separator [
	^super separator ==> [:n|
	 String streamContents: [:s | (XMLWriter on: s)
	 	lineBreak: '<br>'; string: n asString; write]]
]

{ #category : #accessing }
EbDictionaryParser >> start [
	^super start
]

{ #category : #accessing }
EbDictionaryParser >> text [
	^super text ==> [:n| String streamContents: [:s | (XMLWriter on: s) isEscaping: false; writeWith: [:w|
	w tag: #p with: n]]]
]
