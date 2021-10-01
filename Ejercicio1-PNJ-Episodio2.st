!classDefinition: #Desconocido category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
DenotativeObject subclass: #Desconocido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Desconocido class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Desconocido class
	instanceVariableNames: ''!

!Desconocido class methodsFor: 'as yet unclassified' stamp: 'Jh 9/29/2021 13:32:49'!
interaccionCon: unNpc cantidadDeVecesInteraccion: cantidadInteracciones

   ^ unNpc interactuarConDesconocido: cantidadInteracciones.! !


!classDefinition: #Npc category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
DenotativeObject subclass: #Npc
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Npc class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Npc class
	instanceVariableNames: 'frasesPrometedoras frasesDesconocidos primeraInteraccion personajesInteractuados'!

!Npc class methodsFor: 'interacciones' stamp: 'jh 9/30/2021 21:46:59'!
interactuarConDesconocido: cantidadInteracciones
  
  ^ self responderSegunCantidadDeInteracciones: cantidadInteracciones conFrase: frasesDesconocidos.! !

!Npc class methodsFor: 'interacciones' stamp: 'jh 9/30/2021 21:47:13'!
interactuarConPrometedor: cantidadInteracciones

   ^ self responderSegunCantidadDeInteracciones: cantidadInteracciones conFrase: frasesPrometedoras.! !

!Npc class methodsFor: 'interacciones' stamp: 'jh 10/1/2021 12:40:50'!
olvidar

	personajesInteractuados keys do:[:personaje | self olvidarInteraccionCon: personaje].! !

!Npc class methodsFor: 'interacciones' stamp: 'jh 9/30/2021 21:47:48'!
olvidarInteraccionCon: unPersonaje

   self colocarCantidadDeInteracciones: primeraInteraccion a: unPersonaje! !


!Npc class methodsFor: 'interacciones-private' stamp: 'jh 9/30/2021 21:48:05'!
aumentarInteraccionesCon: unPersonaje

     self colocarCantidadDeInteracciones: ((personajesInteractuados at: unPersonaje)+ 1) a: unPersonaje.! !

!Npc class methodsFor: 'interacciones-private' stamp: 'jh 9/30/2021 21:48:21'!
buscarCantidadDeInteracciones: unPersonaje

  ^ (personajesInteractuados at: unPersonaje ifAbsent: [self nuevaInteraccionCon: unPersonaje]) value.! !

!Npc class methodsFor: 'interacciones-private' stamp: 'jh 9/30/2021 21:48:44'!
cantidadDeInteracciones:unPersonaje
    |cantidadInteracciones|

     cantidadInteracciones := self buscarCantidadDeInteracciones: unPersonaje.
     self aumentarInteraccionesCon: unPersonaje.

   ^ cantidadInteracciones.! !

!Npc class methodsFor: 'interacciones-private' stamp: 'jh 9/30/2021 21:48:59'!
colocarCantidadDeInteracciones: cantidadAColocar a: unPersonaje

      personajesInteractuados at: unPersonaje put: cantidadAColocar.

    ! !

!Npc class methodsFor: 'interacciones-private' stamp: 'jh 9/30/2021 21:49:30'!
nuevaInteraccionCon: unPersonaje

  self colocarCantidadDeInteracciones: primeraInteraccion a: unPersonaje.

  ^ primeraInteraccion.! !

!Npc class methodsFor: 'interacciones-private' stamp: 'jh 9/30/2021 21:49:57'!
responderSegunCantidadDeInteracciones:cantidad conFrase: frases

	^ frases at: (cantidad min: frases size)! !


!Npc class methodsFor: 'as yet unclassified' stamp: 'jh 10/1/2021 12:43:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesPrometedoras := nil.
	frasesDesconocidos := nil.
	primeraInteraccion := nil.
	personajesInteractuados := nil.! !


!classDefinition: #CarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Npc subclass: #CarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
CarolinaLaCurandera class
	instanceVariableNames: ''!

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'Jh 9/29/2021 13:33:40'!
interactuarCon: unPersonaje
  |interaccion|
    interaccion := unPersonaje interactuarCon: self conCantidadDeInteracciones: (self cantidadDeInteracciones: unPersonaje).
    self influenciaAlPuebloSobre: unPersonaje.

   ^ interaccion.
	! !


!CarolinaLaCurandera class methodsFor: 'interacciones-privada' stamp: 'Jh 9/29/2021 13:39:25'!
influenciaAlPuebloSobre: unPersonaje.

     ((self buscarCantidadDeInteracciones:unPersonaje) > (frasesDesconocidos size)) ifTrue:[
	   Riverwood sugerirPrometedor: unPersonaje.
	].! !


!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'jh 10/1/2021 12:43:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesPrometedoras := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	frasesDesconocidos := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	primeraInteraccion := 1.
	personajesInteractuados := ((Dictionary new) add: (Hamilton->1); add: (Tirion->1); yourself).! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Npc subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: ''!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'Jh 9/29/2021 13:33:52'!
interactuarCon: unPersonaje
	^ unPersonaje interactuarCon: self conCantidadDeInteracciones: (self cantidadDeInteracciones: unPersonaje).! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'jh 10/1/2021 12:43:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesPrometedoras := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	frasesDesconocidos := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	primeraInteraccion := 1.
	personajesInteractuados := ((Dictionary new) add: (Hamilton->1); add: ('hamilton'->1); add: ('tirion'->1); add: ('tirom'->1); add: ('tiron'->1); add: (Tirion->1); yourself).! !


!classDefinition: #Personaje category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
DenotativeObject subclass: #Personaje
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Personaje class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Personaje class
	instanceVariableNames: 'tipo'!

!Personaje class methodsFor: 'as yet unclassified' stamp: 'jh 9/30/2021 21:58:05'!
desconocido

     tipo := Desconocido

     ! !

!Personaje class methodsFor: 'as yet unclassified' stamp: 'jh 9/30/2021 22:04:01'!
esVistoComo: unTipo

    ^ (tipo == unTipo).! !

!Personaje class methodsFor: 'as yet unclassified' stamp: 'jh 10/1/2021 12:43:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	tipo := nil.! !

!Personaje class methodsFor: 'as yet unclassified' stamp: 'jh 9/30/2021 21:54:54'!
interactuarCon: unNpc conCantidadDeInteracciones: cantidadInteracciones

    ^ tipo interaccionCon: unNpc cantidadDeVecesInteraccion: cantidadInteracciones.! !

!Personaje class methodsFor: 'as yet unclassified' stamp: 'jh 9/30/2021 21:58:15'!
prometedor

    tipo := Prometedor

     ! !


!classDefinition: #Hamilton category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Personaje subclass: #Hamilton
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Hamilton class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Hamilton class
	instanceVariableNames: ''!

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'jh 10/1/2021 12:43:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	tipo := Prometedor.! !


!classDefinition: #Tirion category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Personaje subclass: #Tirion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tirion class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Tirion class
	instanceVariableNames: ''!

!Tirion class methodsFor: 'as yet unclassified' stamp: 'jh 10/1/2021 12:43:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	tipo := Prometedor.! !


!classDefinition: #Prometedor category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
DenotativeObject subclass: #Prometedor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prometedor class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Prometedor class
	instanceVariableNames: ''!

!Prometedor class methodsFor: 'as yet unclassified' stamp: 'Jh 9/29/2021 13:32:56'!
interaccionCon: unNpc cantidadDeVecesInteraccion: cantidadInteracciones

   ^ unNpc interactuarConPrometedor: cantidadInteracciones.
       ! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'jh 9/28/2021 14:52:07'!
carolinaLaCurandera
	^ CarolinaLaCurandera.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'jh 9/28/2021 12:54:30'!
hamilton
	^ Hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'jh 9/28/2021 12:54:20'!
tirion
	^ Tirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'Jh 9/29/2021 13:37:00'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^ Riverwood esVistoComoPrometedor: unPersonaje.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'jh 9/28/2021 15:07:48'!
hacerQueLaCuranderaOlvideSusInteracciones

   CarolinaLaCurandera olvidar.
	! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'jh 9/28/2021 15:34:10'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood olvidarCalificaciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'jh 10/1/2021 12:30:16'!
hacerQueRiverwoodVeaPrometedorAHamilton
	Riverwood personajePrometedor: Hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'Jh 9/27/2021 22:41:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'jh 9/28/2021 12:34:33'!
hamilton
	^ Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'jh 9/28/2021 12:34:25'!
tirion
	^ Tirion.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'jh 9/28/2021 15:50:31'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood olvidarCalificaciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'jh 9/28/2021 15:51:18'!
hacerQueRiverwoodVeaPrometedorAHamilton
	Riverwood personajePrometedor: Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #Riverwood category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
DenotativeObject subclass: #Riverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Riverwood class' category: 'Ejercicio1-PNJ-Episodio2- Refactor-SinCodigoRepetido'!
Riverwood class
	instanceVariableNames: ''!

!Riverwood class methodsFor: 'as yet unclassified' stamp: 'jh 9/30/2021 22:04:35'!
esVistoComoPrometedor: unPersonaje

     ^ unPersonaje esVistoComo: Prometedor.! !

!Riverwood class methodsFor: 'as yet unclassified' stamp: 'jh 9/30/2021 21:58:58'!
olvidarCalificaciones

    Tirion desconocido.
    Hamilton desconocido.

! !

!Riverwood class methodsFor: 'as yet unclassified' stamp: 'jh 9/30/2021 21:59:05'!
personajePrometedor: unPersonaje

       unPersonaje prometedor.! !

!Riverwood class methodsFor: 'as yet unclassified' stamp: 'Jh 9/29/2021 13:39:11'!
sugerirPrometedor: unPersonaje.

   self personajePrometedor: unPersonaje.
   CarolinaLaCurandera olvidarInteraccionCon: unPersonaje.
   TreborElGuardiaDeSkyrim olvidarInteraccionCon: unPersonaje.! !

Npc initializeAfterFileIn!
CarolinaLaCurandera initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!
Personaje initializeAfterFileIn!
Hamilton initializeAfterFileIn!
Tirion initializeAfterFileIn!