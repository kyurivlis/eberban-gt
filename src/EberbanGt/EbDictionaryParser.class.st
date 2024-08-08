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
			tag: #span attributes: {#class -> #argType} with: (n at: 3)]]]]
]

{ #category : #accessing }
EbDictionaryParser >> escapeString [
	^ [:n | self writerToString: [:w| w string: n asString]]
]

{ #category : #accessing }
EbDictionaryParser >> gloss [
	^super text ==> [:n| self writerToString: [:w|
		w tag: #span attributes: {#class -> #gloss} with: n]]
]

{ #category : #accessing }
EbDictionaryParser >> link [
	^super link ==> [ :n | self writerToString: [:w|
		w tag: #span attributes: {#class -> #link} with: (n at: 2)]]
]

{ #category : #accessing }
EbDictionaryParser >> separator [
	^ super separator ==> self escapeString
]

{ #category : #accessing }
EbDictionaryParser >> start [
	^super start
]

{ #category : #accessing }
EbDictionaryParser >> text [
	^super text ==>  [:n | String streamContents: [ :s |(XMLWriter on: s) isEscaping: false; writeWith: [:w|
		n do: [:e| w string: e]]]]
]

{ #category : #accessing }
EbDictionaryParser >> word [
	^super word ==> self escapeString
]

{ #category : #accessing }
EbDictionaryParser >> writerToString: aBlock [
	^String streamContents: [:s|aBlock value: ((XMLWriter on: s) lineBreak: '<br>'; yourself)]
]
