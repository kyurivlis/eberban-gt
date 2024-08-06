"
I know how words can be constructed and segregated.
"
Class {
	#name : #EbMorphology,
	#superclass : #Object,
	#category : #EberbanGt
}

{ #category : #accessing }
EbMorphology >> consonants [
]

{ #category : #accessing }
EbMorphology >> initialPairs [
]

{ #category : #accessing }
EbMorphology >> medialPairs [
]

{ #category : #accessing }
EbMorphology >> sonorants [
	^'nrl'
]

{ #category : #accessing }
EbMorphology >> surds [
	^'mpbfvtdszcjgk'
]

{ #category : #accessing }
EbMorphology >> vhowels [
	^self vowels , 'h'
]

{ #category : #accessing }
EbMorphology >> vowels [
	^'ieaou'
]
