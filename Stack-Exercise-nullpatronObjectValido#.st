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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'OG 11/3/2021 12:52:35'!
test01FindASentenceWithoutCaseSensitive

  |sentence stack resultado|

 stack := OOStack new.
 stack push: 'Quitate de aca'.
 stack push: 'Quiero agua'.
 stack push: 'Quita este test'.

sentence := SentenceFinderByPrefix withStack: stack.

resultado := sentence find: 'Quiero'.

self assert: 'Quiero agua' equals: (resultado at: 1).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'OG 11/3/2021 12:53:02'!
test02FindASentenceWithCaseSensitive

  |sentence stack resultado|

 stack := OOStack new.
 stack push: 'Quitate de aca'.
 stack push: 'quitate de aca'.
 stack push: 'Quita este test'.

sentence := SentenceFinderByPrefix withStack: stack.
resultado := sentence find: 'quitate'.

self assert: 'quitate de aca' equals: (resultado at: 1).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'OG 11/3/2021 13:06:35'!
test03IfItCantFindASentenceWithCommonPrefixReturnsAnEmptyArray

  |sentence stack resultado|

 stack := OOStack new.
 stack push: 'Quiero Comer'.
 stack push: 'Quiero Dormir'.
 stack push: 'Quita este test'.

sentence := SentenceFinderByPrefix withStack: stack.
resultado := sentence find: 'hola'.

self assert: 0 equals: resultado size.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'OG 11/3/2021 12:59:41'!
test04FindASentenceUsingAPrefixWithTwoMatchingResults

  |sentence stack resultado|

 stack := OOStack new.
 stack push: 'Quiero Comer'.
 stack push: 'Quiero Dormir'.
 stack push: 'Quita este test'.

sentence := SentenceFinderByPrefix withStack: stack.
resultado := sentence find: 'Quiero'.

self assert: 2 equals: resultado size.
self assert: 'Quiero Dormir' equals: (resultado at: 1).
self assert: 'Quiero Comer' equals: (resultado at: 2).! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'OG 11/3/2021 13:01:28'!
test05SendingAnEmptyPrefixSouldRaiseAnError

|sentence stack|

 stack := OOStack new.

sentence := SentenceFinderByPrefix withStack: stack.

 self
		should: [ sentence find: '' ]
		raise: Error 
		withExceptionDo: [ :arg1 |
			self assert: arg1 messageText = SentenceFinderByPrefix errorMessage ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'OG 11/3/2021 13:01:11'!
test06SendingAPrefixWithASpaceShouldRaiseAnError

|sentence stack|

 stack := OOStack new.

sentence := SentenceFinderByPrefix withStack: stack.

 self
		should: [ sentence find: 'hol ' ]
		raise: Error 
		withExceptionDo: [ :arg1 |
			self assert: arg1 messageText = SentenceFinderByPrefix errorMessage2 ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'OG 11/3/2021 13:02:54'!
test07TheStackElementsRemainInTheSameOrderAfterUsingFindTwice

|sentence stack resultado|

 stack := OOStack new.
 stack push: 'Quiero Comer'.
 stack push: 'Quiero Dormir'.
 stack push: 'Quita este test'.

sentence := SentenceFinderByPrefix withStack: stack.
resultado := sentence find: 'Quiero'.

self assert: 2 equals: resultado size.
self assert: 'Quiero Dormir' equals: (resultado at: 1).
self assert: 'Quiero Comer' equals: (resultado at: 2).

resultado := sentence find: 'Quiero'.

self assert: 2 equals: resultado size.
self assert: 'Quiero Dormir' equals: (resultado at: 1).
self assert: 'Quiero Comer' equals: (resultado at: 2).! !


!classDefinition: #Node category: 'Stack-Exercise-nullpatronObjectValido?'!
Object subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!Node methodsFor: 'valuesNode'!
next
	self subclassResponsibility.! !

!Node methodsFor: 'valuesNode'!
topNodeOf: arg1
	self subclassResponsibility.! !

!Node methodsFor: 'valuesNode'!
value
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'Stack-Exercise-nullpatronObjectValido?'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'as yet unclassified'!
withValue: arg1
	^ self new with: arg1.! !


!classDefinition: #NullNode category: 'Stack-Exercise-nullpatronObjectValido?'!
Node subclass: #NullNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!NullNode methodsFor: 'as yet unclassified'!
next
	^ self.! !

!NullNode methodsFor: 'as yet unclassified'!
topNodeOf: arg1
	^ arg1 TopNodeNull.! !

!NullNode methodsFor: 'as yet unclassified'!
value
	^ self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NullNode class' category: 'Stack-Exercise-nullpatronObjectValido?'!
NullNode class
	instanceVariableNames: ''!

!NullNode class methodsFor: 'as yet unclassified'!
createEmptyNode
	^ NullNode new.! !


!classDefinition: #RealNode category: 'Stack-Exercise-nullpatronObjectValido?'!
Node subclass: #RealNode
	instanceVariableNames: 'value next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!RealNode methodsFor: 'as yet unclassified'!
next
	^ next.! !

!RealNode methodsFor: 'as yet unclassified'!
topNodeOf: arg1
	^ arg1 TopNodeReal.! !

!RealNode methodsFor: 'as yet unclassified'!
value
	^ value.! !

!RealNode methodsFor: 'as yet unclassified'!
with: arg1 withNext: arg2
	value _ arg1.
	next _ arg2.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RealNode class' category: 'Stack-Exercise-nullpatronObjectValido?'!
RealNode class
	instanceVariableNames: ''!

!RealNode class methodsFor: 'creation'!
withValue: arg1 withNext: arg2
	^ self new
		with: arg1
		withNext: arg2.! !


!classDefinition: #OOStack category: 'Stack-Exercise-nullpatronObjectValido?'!
Object subclass: #OOStack
	instanceVariableNames: 'last head aSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!OOStack methodsFor: 'stackOperations'!
pop
	| temp1 |
	temp1 _ head topNodeOf: self.
	head _ head next.
	aSize _ aSize - 1.
	^ temp1.! !

!OOStack methodsFor: 'stackOperations'!
push: arg1
	| temp2 |
	temp2 _ RealNode
		withValue: arg1
		withNext: head.
	head _ temp2.
	aSize _ aSize + 1.! !

!OOStack methodsFor: 'stackOperations'!
top
	^ head topNodeOf: self.! !


!OOStack methodsFor: 'create initialize'!
initialize
	head _ NullNode createEmptyNode.
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
	instanceVariableNames: 'stack stackAux'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise-nullpatronObjectValido?'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jh 11/2/2021 10:11:37'!
apilar

 [stackAux size > 0] whileTrue: [stack push: stackAux removeLast].! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jh 11/2/2021 10:10:44'!
desapilar

 [stack isEmpty not] whileTrue: [stackAux add: stack pop].! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jh 11/2/2021 11:02:32'!
find: aPrefix

|resultado|

 (aPrefix size == 0) ifTrue: [^ self error: self class errorMessage].
 (aPrefix includes: $ ) ifTrue: [^ self error: self class errorMessage2].

  self desapilar.

  resultado := stackAux select: [: oracion| oracion  beginsWith: aPrefix ].

  self apilar.

 ^ resultado.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jh 11/2/2021 10:07:48'!
initialize

  stackAux := OrderedCollection new.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'jh 11/2/2021 10:12:22'!
with: aStack

  stack := aStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise-nullpatronObjectValido?'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'jh 11/2/2021 10:21:38'!
errorMessage

  ^ 'Error no puede colocar un prefijo vacio'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'jh 11/2/2021 10:30:17'!
errorMessage2

  ^ 'Error no puede colocar un espacio'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'jh 11/2/2021 10:12:06'!
withStack: aStack

  ^ self new with: aStack.! !
