!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook johnLennon paulMcCartney'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'Jh 10/11/2021 12:52:33'!
setUp
 
   customerBook := CustomerBook new.

    paulMcCartney := 'Paul McCartney'.

    johnLennon := 'John Lennon'.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'jh 10/11/2021 14:40:20'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := self millisecond.
	customerBook addCustomerNamed: johnLennon.
	millisecondsAfterRunning := self millisecond.
	
	self assertheDifference: (self millisecondsDifferenceBetween: millisecondsAfterRunning and: millisecondsBeforeRunning) isLessThan: 50.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'jh 10/11/2021 14:40:45'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	customerBook addCustomerNamed: paulMcCartney.
	millisecondsBeforeRunning := self millisecond.
	customerBook removeCustomerNamed: paulMcCartney.
	millisecondsAfterRunning := self millisecond.
	
	self assertheDifference: (self millisecondsDifferenceBetween: millisecondsAfterRunning and:    millisecondsBeforeRunning) isLessThan: 100.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Jh 10/11/2021 13:56:36'!
test03CanNotAddACustomerWithEmptyName 
			
      self on: [ customerBook addCustomerNamed: ''.
	self fail ] andAnError:   Error  do:  [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Jh 10/11/2021 13:57:25'!
test04CanNotRemoveAnInvalidCustomer
	
	customerBook addCustomerNamed: johnLennon.
	
	self on:[ customerBook removeCustomerNamed: paulMcCartney.
	self fail ] andAnError:  NotFound   do:  [self assertThatTheOnlyCustomerIsJohnLennon ]
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Jh 10/11/2021 13:29:35'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
       self assertCustomerBooksWithActive: 0 suspended: 1 andTotalCustomers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Jh 10/11/2021 13:29:52'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertCustomerBooksWithActive: 0 suspended: 0 andTotalCustomers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Jh 10/11/2021 13:58:01'!
test07CanNotSuspendAnInvalidCustomer
	
	customerBook addCustomerNamed: johnLennon.
	
	self on:[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ] andAnError:  CantSuspend   do:  [self assertThatTheOnlyCustomerIsJohnLennon ]
	
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Jh 10/11/2021 13:58:47'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self on: [ customerBook suspendCustomerNamed: johnLennon.
	self fail ] andAnError:  CantSuspend   do:  [self assertThatTheOnlyCustomerIsJohnLennon ]
	
	! !


!CustomerBookTest methodsFor: 'time' stamp: 'Jh 10/11/2021 12:54:51'!
millisecond

    ^ Time millisecondClockValue * millisecond! !

!CustomerBookTest methodsFor: 'time' stamp: 'Jh 10/11/2021 12:58:40'!
millisecondsDifferenceBetween: millisecondsAfterRunning and: millisecondsBeforeRunning

  ^ millisecondsAfterRunning-millisecondsBeforeRunning.! !


!CustomerBookTest methodsFor: 'error' stamp: 'Jh 10/11/2021 13:39:28'!
on: aCondition andAnError: anError do: aClosure 


  aCondition on: anError do: aClosure! !


!CustomerBookTest methodsFor: 'asserts' stamp: 'Jh 10/11/2021 13:28:45'!
assertCustomerBooksWithActive: activeCustomers suspended: suspendedCustomers andTotalCustomers: totalCustomers

        self assert: activeCustomers equals: customerBook numberOfActiveCustomers.
	self assert:suspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: totalCustomers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'Jh 10/11/2021 13:32:01'!
assertThatTheOnlyCustomerIsJohnLennon

    self assert: customerBook numberOfCustomers = 1.
    self assert: (customerBook includesCustomerNamed: johnLennon) ! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'jh 10/11/2021 14:36:57'!
assertheDifference: differenceMilliseconds isLessThan: maximalTime

      self assert: (differenceMilliseconds) < (maximalTime * millisecond).! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Jh 10/11/2021 12:22:27'!
addCustomer: aName to: aCollection

       aCollection add: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'Jh 10/11/2021 13:44:59'!
addCustomerNamed: aName

       self ifTrue: (self isEmpty:aName) do: [ self signalCustomerNameCannotBeEmpty ].
       self ifTrue: (self includesCustomerNamed: aName) do: [ self signalCustomerAlreadyExists ].
	
	self addCustomer: aName to: active.! !

!CustomerBook methodsFor: 'customer management' stamp: 'Jh 10/11/2021 12:22:04'!
removeCustomer: aName from: aCollection

     aCollection remove: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'Jh 10/11/2021 13:45:45'!
removeCustomerNamed: aName 
 
         self ifFalse: (self includesCustomerNamed: aName) do: [^ NotFound signal.].
	
	self searchIn: active andRemove: aName.
	self searchIn: suspended andRemove: aName
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'Jh 10/11/2021 13:47:12'!
searchIn: aCollection andRemove: aName

     self ifTrue: (self theCollection: aCollection includesCustomerNamed: aName) do: [self removeCustomer: aName from: aCollection].! !

!CustomerBook methodsFor: 'customer management' stamp: 'Jh 10/11/2021 13:46:33'!
suspendCustomerNamed: aName 
	
	 self ifFalse: (self theCollection: active includesCustomerNamed: aName) do: [^CantSuspend signal].
	
	
	self removeCustomer: aName from: active.
	
	self addCustomer: aName to: suspended.
! !


!CustomerBook methodsFor: 'accessing' stamp: 'Jh 10/11/2021 12:10:19'!
numberOfActiveCustomers
	
	^self numberOfCustomersIn: active.! !

!CustomerBook methodsFor: 'accessing' stamp: 'Jh 10/11/2021 12:07:12'!
numberOfCustomers
	
	^(self numberOfCustomersIn: active) + (self numberOfCustomersIn: suspended).! !

!CustomerBook methodsFor: 'accessing' stamp: 'OG 10/11/2021 11:35:09'!
numberOfCustomersIn: aCollection
	
	^aCollection size.! !

!CustomerBook methodsFor: 'accessing' stamp: 'Jh 10/11/2021 12:10:04'!
numberOfSuspendedCustomers
	
	^self numberOfCustomersIn: suspended.! !


!CustomerBook methodsFor: 'testing' stamp: 'Jh 10/11/2021 12:15:18'!
includesCustomerNamed: aName

	^(self theCollection: active includesCustomerNamed: aName) or: [
		 self theCollection: suspended includesCustomerNamed: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'Jh 10/11/2021 12:18:50'!
isEmpty
	
	^(self isEmpty:active) and: [self isEmpty:suspended]! !

!CustomerBook methodsFor: 'testing' stamp: 'Jh 10/11/2021 12:18:17'!
isEmpty: aName
	
	^ aName isEmpty.! !

!CustomerBook methodsFor: 'testing' stamp: 'Jh 10/11/2021 12:16:31'!
theCollection: aCollection includesCustomerNamed: aName 


     ^  aCollection includes: aName
! !


!CustomerBook methodsFor: 'signal errors' stamp: 'Jh 10/11/2021 12:35:45'!
signalCreation: anErrorClass

  self error: anErrorClass. ! !

!CustomerBook methodsFor: 'signal errors' stamp: 'Jh 10/11/2021 12:36:24'!
signalCustomerAlreadyExists 

     self signalCreation: (self class customerAlreadyExistsErrorMessage).

	! !

!CustomerBook methodsFor: 'signal errors' stamp: 'Jh 10/11/2021 12:36:52'!
signalCustomerNameCannotBeEmpty 

       self signalCreation:( self class customerCanNotBeEmptyErrorMessage).
	! !


!CustomerBook methodsFor: 'conditionals' stamp: 'Jh 10/11/2021 13:43:40'!
ifFalse: aCondition do: anAction

     aCondition ifFalse: anAction.! !

!CustomerBook methodsFor: 'conditionals' stamp: 'Jh 10/11/2021 13:43:16'!
ifTrue: aCondition do: anAction

     aCondition ifTrue: anAction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
