!classDefinition: #OOStackTest category: 'Stack-Exercise-nullpatronObjectValido?'!
TestCase subclass: #OOStackTest
	instanceVariableNames: 'stack1'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!OOStackTest methodsFor: 'test'!
test01StackShouldBeEmptyWhenCreated
	self assert: stack1 isEmpty.! !

!OOStackTest methodsFor: 'test'!
test02PushAddElementsToTheStack
	stack1 push: 'something'.
	self deny: stack1 isEmpty.! !

!OOStackTest methodsFor: 'test'!
test03PopRemovesElementsFromTheStack
	stack1 push: 'something'.
	stack1 pop.
	self assert: stack1 isEmpty.! !

!OOStackTest methodsFor: 'test'!
test04PopReturnsLastPushedObject
	| temp1 |
	temp1 _ 'something'.
	stack1 push: temp1.
	self assert: stack1 pop = temp1.! !

!OOStackTest methodsFor: 'test'!
test05StackBehavesLIFO
	| temp1 temp2 |
	temp1 _ 'first'.
	temp2 _ 'second'.
	stack1 push: temp1.
	stack1 push: temp2.
	self assert: stack1 pop = temp2.
	self assert: stack1 pop = temp1.
	self assert: stack1 isEmpty.! !

!OOStackTest methodsFor: 'test'!
test06TopReturnsLastPushedObject
	| temp1 |
	temp1 _ 'something'.
	stack1 push: temp1.
	self assert: stack1 top = temp1.! !

!OOStackTest methodsFor: 'test'!
test07TopDoesNotRemoveObjectFromStack
	| temp1 |
	temp1 _ 'something'.
	stack1 push: temp1.
	self assert: stack1 size = 1.
	stack1 top.
	self assert: stack1 size = 1.! !

!OOStackTest methodsFor: 'test'!
test08CanNotPopWhenThereAreNoObjectsInTheStack
	self
		should: [ stack1 pop ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :arg1 |
			self assert: arg1 messageText = OOStack stackEmptyErrorDescription ].! !

!OOStackTest methodsFor: 'test'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects
	stack1 push: 'something'.
	stack1 pop.
	self
		should: [ stack1 pop ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :arg1 |
			self assert: arg1 messageText = OOStack stackEmptyErrorDescription ].! !

!OOStackTest methodsFor: 'test'!
test10CanNotTopWhenThereAreNoObjectsInTheStack
	self
		should: [ stack1 top ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :arg1 |
			self assert: arg1 messageText = OOStack stackEmptyErrorDescription ].! !


!OOStackTest methodsFor: 'as yet unclassified'!
setUp
	stack1 _ OOStack new.! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise-nullpatronObjectValido?'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!SentenceFinderByPrefixTest methodsFor: 'testSentence' stamp: 'jh 11/3/2021 14:20:52'!
test01FindASentenceWithoutCaseSensitive

  |sentences sentencesFound|

sentences := self createSentencesFinder.

sentencesFound := sentences find: 'This'.

self assert: 'This is my dog' equals: (sentencesFound at: 1).! !

!SentenceFinderByPrefixTest methodsFor: 'testSentence' stamp: 'jh 11/3/2021 14:33:05'!
test02FindASentenceWithCaseSensitive

  |sentencesFinder sentencesFound |

 sentencesFinder := self createSentencesFinder.

 sentencesFound := sentencesFinder find: 'give'.

 self assert: 'give me food' equals: (sentencesFound at: 1).! !

!SentenceFinderByPrefixTest methodsFor: 'testSentence' stamp: 'jh 11/3/2021 14:41:23'!
test03IfItCantFindASentenceWithCommonPrefixReturnsAnEmptyArray

  |sentencesFinder sentencesFound|

 sentencesFinder := self createSentencesFinder.

 sentencesFound := sentencesFinder find: 'hi'.

 self assert: 0 equals: (sentencesFound size).


! !

!SentenceFinderByPrefixTest methodsFor: 'testSentence' stamp: 'jh 11/3/2021 14:52:29'!
test04FindASentenceUsingAPrefixWithThreeMatchingResults

  |sentencesFinder sentencesFound |

sentencesFinder := self createSentencesFinder.

 sentencesFound := sentencesFinder find: 'Give'.

self AssertThatItFoundThreeSentencesInTheCorrectOrder: sentencesFound.! !

!SentenceFinderByPrefixTest methodsFor: 'testSentence' stamp: 'jh 11/3/2021 15:04:49'!
test05SendingAnEmptyPrefixSouldRaiseAnError

|sentencesFinder|

 sentencesFinder := self createSentencesFinder.

 self withAction: [ sentencesFinder find: '' ] ShouldRaiseTheError: [SentenceFinderByPrefix errorAPrefixCantBeEmpty].
		
		! !

!SentenceFinderByPrefixTest methodsFor: 'testSentence' stamp: 'jh 11/3/2021 15:03:42'!
test06SendingAPrefixWithASpaceShouldRaiseAnError

|sentencesFinder |

 sentencesFinder := self createSentencesFinder.

  self withAction: [ sentencesFinder find: 'hol ' ] ShouldRaiseTheError: [SentenceFinderByPrefix errorAPrefixCantContainAnySpaces].
		! !

!SentenceFinderByPrefixTest methodsFor: 'testSentence' stamp: 'jh 11/3/2021 14:53:09'!
test07TheStackElementsRemainInTheSameOrderAfterUsingFindTwice

|sentencesFinder sentencesFound|

 sentencesFinder := self createSentencesFinder.

 sentencesFound := sentencesFinder find: 'Give'.

 self AssertThatItFoundThreeSentencesInTheCorrectOrder: sentencesFound.

 sentencesFound := sentencesFinder find: 'Give'.

 self AssertThatItFoundThreeSentencesInTheCorrectOrder: sentencesFound.
! !


!SentenceFinderByPrefixTest methodsFor: 'sentencesCreation' stamp: 'jh 11/3/2021 14:20:43'!
createSentencesFinder

|stack|

stack := OOStack new.
stack push: 'Give me water'.
stack push: 'Give me food'.
stack push:'Given the case i will go'.
stack push: 'give me food'.
stack push: 'giVe me water'.
stack push: 'This is my dog'.

 ^ SentenceFinderByPrefix withStack: stack.! !


!SentenceFinderByPrefixTest methodsFor: 'initalize' stamp: 'jh 11/3/2021 14:10:27'!
setUp! !


!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'jh 11/3/2021 14:52:03'!
AssertThatItFoundThreeSentencesInTheCorrectOrder: sentencesFound

self assert: 3 equals: sentencesFound size.
self assert: 'Given the case i will go' equals: (sentencesFound at: 1).
self assert: 'Give me food' equals: (sentencesFound at: 2).
self assert: 'Give me water' equals: (sentencesFound at: 3).
! !


!SentenceFinderByPrefixTest methodsFor: 'error' stamp: 'jh 11/3/2021 15:02:23'!
withAction: anAction ShouldRaiseTheError: anError

 self  should: anAction
		raise: Error 
		withExceptionDo: [ :arg1 |
			self assert: arg1 messageText = anError value ].! !

!SentenceFinderByPrefixTest methodsFor: 'error' stamp: 'jh 11/3/2021 15:01:12'!
xxx: firstBlock xxx: secondBlock

 self  should: firstBlock
		raise: Error 
		withExceptionDo: [ :arg1 |
			self assert: arg1 messageText = secondBlock value ].! !


!classDefinition: #Node category: 'Stack-Exercise-nullpatronObjectValido?'!
Object subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!Node methodsFor: 'Node behaviour'!
next
	self subclassResponsibility.! !

!Node methodsFor: 'Node behaviour' stamp: 'jh 11/3/2021 13:41:54'!
topNodeOf: aStack
	self subclassResponsibility.! !

!Node methodsFor: 'Node behaviour'!
value
	self subclassResponsibility.! !


!Node methodsFor: 'creation' stamp: 'jh 11/3/2021 13:46:59'!
with: aValue withNext: nextNode

 self subclassResponsibility.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise-nullpatronObjectValido?'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'as yet unclassified' stamp: 'jh 11/3/2021 13:47:24'!
searchNodeType: aValue

  ^ self subclasses detect:[ :x| x instanciateTo: aValue ].! !

!Node class methodsFor: 'as yet unclassified' stamp: 'jh 11/3/2021 13:48:17'!
withValue: aValue withNext: aNext

  ^(self searchNodeType: aValue) new with: aValue withNext: aNext.! !


!classDefinition: #EmptyNode category: 'Stack-Exercise-nullpatronObjectValido?'!
Node subclass: #EmptyNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!EmptyNode methodsFor: 'Node behaviour' stamp: 'jh 11/3/2021 13:40:57'!
next
	! !

!EmptyNode methodsFor: 'Node behaviour' stamp: 'jh 11/3/2021 13:40:40'!
topNodeOf: stack
	^ stack TopNodeNull.! !

!EmptyNode methodsFor: 'Node behaviour' stamp: 'jh 11/3/2021 13:40:52'!
value
	! !


!EmptyNode methodsFor: 'creation' stamp: 'jh 11/3/2021 13:46:37'!
with: aValue withNext: nextNode! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyNode class' category: 'Stack-Exercise-nullpatronObjectValido?'!
EmptyNode class
	instanceVariableNames: ''!

!EmptyNode class methodsFor: 'as yet unclassified' stamp: 'jh 11/3/2021 13:49:52'!
instanciateTo: aValue

   ^ (aValue == 0).! !


!classDefinition: #RealNode category: 'Stack-Exercise-nullpatronObjectValido?'!
Node subclass: #RealNode
	instanceVariableNames: 'value next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!RealNode methodsFor: 'Node behaviour'!
next
	^ next.! !

!RealNode methodsFor: 'Node behaviour' stamp: 'jh 11/3/2021 13:41:34'!
topNodeOf: stack
	^ stack TopNodeReal.! !

!RealNode methodsFor: 'Node behaviour'!
value
	^ value.! !


!RealNode methodsFor: 'creation' stamp: 'jh 11/3/2021 13:42:24'!
with: aValue withNext: nextNode
	value _ aValue.
	next _ nextNode.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RealNode class' category: 'Stack-Exercise-nullpatronObjectValido?'!
RealNode class
	instanceVariableNames: ''!

!RealNode class methodsFor: 'creation' stamp: 'jh 11/3/2021 13:50:10'!
instanciateTo: aValue

 ^ (aValue == 0)not.
 ! !


!classDefinition: #OOStack category: 'Stack-Exercise-nullpatronObjectValido?'!
Object subclass: #OOStack
	instanceVariableNames: 'last head aSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!OOStack methodsFor: 'stackOperations' stamp: 'jh 11/3/2021 15:07:36'!
pop
	| topValue|
	topValue _ head topNodeOf: self.
	head _ head next.
	aSize _ aSize - 1.
	^ topValue.! !

!OOStack methodsFor: 'stackOperations' stamp: 'jh 11/3/2021 13:49:35'!
push: aValue
	| firstNewNode|
	firstNewNode _ Node
		withValue: aValue
		withNext: head.
	head _ firstNewNode.
	aSize _ aSize + 1.! !

!OOStack methodsFor: 'stackOperations'!
top
	^ head topNodeOf: self.! !


!OOStack methodsFor: 'create initialize' stamp: 'jh 11/3/2021 13:48:48'!
initialize
	head _ Node withValue: 0 withNext: 0.
	aSize _ 0.! !


!OOStack methodsFor: 'stackSize'!
isEmpty
	^ aSize == 0.! !

!OOStack methodsFor: 'stackSize'!
size
	^ aSize.! !


!OOStack methodsFor: 'doubleDispatch'!
TopNodeNull
	^ self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'doubleDispatch'!
TopNodeReal
	^ head value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise-nullpatronObjectValido?'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions'!
stackEmptyErrorDescription
	^ 'Stack is empty'.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise-nullpatronObjectValido?'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack collectionAuxiliar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!SentenceFinderByPrefix methodsFor: 'findAPrefix' stamp: 'jh 11/3/2021 15:30:48'!
find: aPrefix

|sentencesWithPrefix|

 (aPrefix size == 0) ifTrue:[^ self error: self class errorAPrefixCantBeEmpty].

 (aPrefix includes:$ ) ifTrue:[^ self error: self class errorAPrefixCantContainAnySpaces].

  self moveElementsFromStackToCollectionAux.

  sentencesWithPrefix := collectionAuxiliar select: [: sentence | sentence  beginsWith: aPrefix ].

  self moveElementsFromCollectionAuxToStack.

 ^ sentencesWithPrefix.! !


!SentenceFinderByPrefix methodsFor: 'creation' stamp: 'jh 11/3/2021 13:56:31'!
initialize

  collectionAuxiliar := OrderedCollection new.! !

!SentenceFinderByPrefix methodsFor: 'creation' stamp: 'jh 11/2/2021 10:12:22'!
with: aStack

  stack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'private methods' stamp: 'jh 11/3/2021 14:02:37'!
moveElementsFromCollectionAuxToStack

 [collectionAuxiliar size > 0] whileTrue: [stack push: collectionAuxiliar removeLast].! !

!SentenceFinderByPrefix methodsFor: 'private methods' stamp: 'jh 11/3/2021 14:03:17'!
moveElementsFromStackToCollectionAux

 [stack isEmpty not] whileTrue: [collectionAuxiliar add: stack pop].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise-nullpatronObjectValido?'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'creation' stamp: 'jh 11/2/2021 10:12:06'!
withStack: aStack

  ^ self new with: aStack.! !


!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'jh 11/3/2021 15:30:03'!
errorAPrefixCantBeEmpty

  ^ 'Error: a prefix cant be empty'.! !

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'jh 11/3/2021 15:29:50'!
errorAPrefixCantContainAnySpaces

  ^ 'Error: a prefix cant contain any spaces'.! !
