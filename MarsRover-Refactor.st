!classDefinition: #MarsRoverTest category: 'MarsRover-Refactor'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!MarsRoverTest methodsFor: 'test' stamp: 'OG 11/16/2021 12:09:49'!
test01ElMarsRoverSeInicializaApuntandoHaciaLaDireccionCorrecta

  |marsRover|
 

   marsRover := MarsRover conCoordenadas: (0 @ 0) apuntando: Norte new.


   self assert: Norte equals: marsRover apuntaHacia.! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:53:00'!
test02MovimientoHaciaAdelanteConMarsRoverApuntandoHaciaElNorteFuncionaCorrectamente

  
  self marsRoverApuntandoHacia: (Norte new) realizaUnaInstruccion: 'f' yTerminaEnCoordenada: (0@1).

   ! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:53:22'!
test03MovimientoHaciaAdelanteConMarsRoverApuntandoHaciaElSurFuncionaCorrectamente

 self marsRoverApuntandoHacia: (Sur new) realizaUnaInstruccion: 'f' yTerminaEnCoordenada: (0@-1).

   ! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:53:45'!
test04MovimientoHaciaAdelanteConMarsRoverApuntandoHaciaElOesteFuncionaCorrectamente

  

  self marsRoverApuntandoHacia: (Oeste new) realizaUnaInstruccion: 'f' yTerminaEnCoordenada: (1@0).
 

  ! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:54:03'!
test05MovimientoHaciaAdelanteConMarsRoverApuntandoHaciaElEsteFuncionaCorrectamente

  
  self marsRoverApuntandoHacia: (Este new) realizaUnaInstruccion: 'f' yTerminaEnCoordenada: (-1@0).

   ! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:54:31'!
test06MovimientoHaciaAtrasConMarsRoverApuntandoHaciaElNorteFuncionaCorrectamente

 

self marsRoverApuntandoHacia: (Norte new) realizaUnaInstruccion: 'b' yTerminaEnCoordenada: (0@-1).
 
! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:54:53'!
test07MovimientoHaciaAtrasConMarsRoverApuntandoHaciaElOesteFuncionaCorrectamente

 
  
  self marsRoverApuntandoHacia: (Oeste new) realizaUnaInstruccion: 'b' yTerminaEnCoordenada: (-1@0).

  ! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:55:15'!
test08MovimientoHaciaAtrasConMarsRoverApuntandoHaciaElEsteFuncionaCorrectamente

  self marsRoverApuntandoHacia: (Este new) realizaUnaInstruccion: 'b' yTerminaEnCoordenada: (1@0).
 
! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:55:36'!
test09MovimientoHaciaAtrasConMarsRoverApuntandoHaciaElSurFuncionaCorrectamente

  self marsRoverApuntandoHacia: (Sur new) realizaUnaInstruccion: 'b' yTerminaEnCoordenada: (0@1).
 

! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:58:06'!
test10RotacionALaDerechaConMarsRoverApuntandoHaciaElNorteFuncionaCorrectamente

 
 
 self marsRoverApuntandoHacia: Norte new realizaUnaRotacion: 'r' yTerminaApuntaHacia: Oeste.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:58:31'!
test11RotacionALaDerechaConMarsRoverApuntandoHaciaElOesteFuncionaCorrectamente

  self marsRoverApuntandoHacia: Oeste new realizaUnaRotacion: 'r' yTerminaApuntaHacia: Sur.

   ! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:58:49'!
test12RotacionALaDerechaConMarsRoverApuntandoHaciaElSurFuncionaCorrectamente

  self marsRoverApuntandoHacia: Sur new realizaUnaRotacion: 'r' yTerminaApuntaHacia: Este.
 

! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:59:06'!
test13RotacionALaDerechaConMarsRoverApuntandoHaciaElEsteFuncionaCorrectamente

  
 
self marsRoverApuntandoHacia: Este new realizaUnaRotacion: 'r' yTerminaApuntaHacia: Norte.
   ! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:59:26'!
test14RotacionALaIzquierdaConMarsRoverApuntandoHaciaElNorteFuncionaCorrectamente

  self marsRoverApuntandoHacia: Norte new realizaUnaRotacion: 'l' yTerminaApuntaHacia: Este.

! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:59:41'!
test15RotacionALaIzquierdaConMarsRoverApuntandoHaciaElOesteFuncionaCorrectamente

  self marsRoverApuntandoHacia: Oeste new realizaUnaRotacion: 'l' yTerminaApuntaHacia: Norte.
 

! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:59:57'!
test16RotacionALaIzquierdaConMarsRoverApuntandoHaciaElSurFuncionaCorrectamente

  self marsRoverApuntandoHacia: Sur new realizaUnaRotacion: 'l' yTerminaApuntaHacia: Oeste.
 

  ! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 14:00:14'!
test17RotacionALaIzquierdaConMarsRoverApuntandoHaciaElEsteFuncionaCorrectamente


 self marsRoverApuntandoHacia: Este new realizaUnaRotacion: 'l' yTerminaApuntaHacia:Sur.
! !

!MarsRoverTest methodsFor: 'test' stamp: 'OG 11/16/2021 12:18:37'!
test18DosMovimientosHaciaAdelanteConMarsRoverApuntandoHaciaElOesteFuncionaCorrectamente

  |marsRover|
 

   marsRover := MarsRover conCoordenadas: (0 @ 0) apuntando:Oeste new.

   marsRover moveteA: 'ff'.

   self assert: (2 @ 0) equals: marsRover coordenadasActuales.! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:46:23'!
test19MultiplesMovimientosYRotacionesFuncionanCorrectamente

  |marsRover|
 

   marsRover := MarsRover conCoordenadas: (0 @ 0) apuntando:Oeste new.

   marsRover moveteA: 'fffbrffrf'.

   self assert: (1 @ -2) equals: marsRover coordenadasActuales.
   self assert: Este equals: marsRover apuntaHacia.! !

!MarsRoverTest methodsFor: 'test' stamp: 'jh 11/16/2021 13:47:26'!
test20DarUnaOrdenInvalidaFrenaAlMarsRoverEnLaPosicionEnLaQueQuedo

  |marsRover|
 

   marsRover := MarsRover conCoordenadas: (0 @ 0) apuntando:Norte new.

   self should: [marsRover moveteA: 'fffllxrf'] raise: Error withExceptionDo: [ :error|
	      self assert: error messageText = MarsRover errorCoordenada.
	      self assert: (0 @ 3) equals: marsRover coordenadasActuales.
	      self assert: Sur equals: marsRover apuntaHacia.
	 ].! !


!MarsRoverTest methodsFor: 'codigoRepetido' stamp: 'jh 11/16/2021 13:51:13'!
marsRoverApuntandoHacia: unaDireccion realizaUnaInstruccion: unaInstruccion yTerminaEnCoordenada: unaCoordena

|marsRover|
 

   marsRover := MarsRover conCoordenadas: (0 @ 0) apuntando: unaDireccion.

   marsRover moveteA: unaInstruccion.

   self assert: unaCoordena equals: marsRover coordenadasActuales.! !

!MarsRoverTest methodsFor: 'codigoRepetido' stamp: 'jh 11/16/2021 13:57:32'!
marsRoverApuntandoHacia: unaDireccion realizaUnaRotacion: unaInstruccion yTerminaApuntaHacia: otraDireccion

|marsRover| 

   marsRover := MarsRover conCoordenadas: (0 @ 0) apuntando: unaDireccion.

   marsRover moveteA:  unaInstruccion.

   self assert: otraDireccion equals: marsRover apuntaHacia.! !


!classDefinition: #Direccion category: 'MarsRover-Refactor'!
Object subclass: #Direccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!Direccion methodsFor: 'acciones' stamp: 'jh 11/12/2021 20:27:32'!
adelantar: alMars

self subclassResponsibility.! !

!Direccion methodsFor: 'acciones' stamp: 'jh 11/12/2021 20:27:44'!
retrasar: alMars

self subclassResponsibility.! !

!Direccion methodsFor: 'acciones' stamp: 'jh 11/12/2021 20:58:04'!
rotacionALaDerechaDe: unMars

  self subclassResponsibility.! !

!Direccion methodsFor: 'acciones' stamp: 'jh 11/12/2021 20:58:11'!
rotacionALaIzquierdaDe: unMars

  self subclassResponsibility.! !


!classDefinition: #Este category: 'MarsRover-Refactor'!
Direccion subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!Este methodsFor: 'acciones' stamp: 'jh 11/13/2021 19:30:46'!
adelantar: alMars

   alMars sumarConCoordenada:(-1@0)! !

!Este methodsFor: 'acciones' stamp: 'jh 11/13/2021 19:30:54'!
retrasar: alMars

    alMars sumarConCoordenada:(1@0)! !

!Este methodsFor: 'acciones' stamp: 'jh 11/16/2021 13:29:51'!
rotacionALaDerechaDe: unMars

  ^ unMars cambiarSentido: Norte new.! !

!Este methodsFor: 'acciones' stamp: 'jh 11/16/2021 13:29:56'!
rotacionALaIzquierdaDe: unMars

  ^ unMars cambiarSentido: Sur new.! !


!classDefinition: #Norte category: 'MarsRover-Refactor'!
Direccion subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!Norte methodsFor: 'acciones' stamp: 'jh 11/13/2021 19:30:27'!
adelantar: alMars

   alMars sumarConCoordenada:(0@1)! !

!Norte methodsFor: 'acciones' stamp: 'jh 11/13/2021 19:30:33'!
retrasar: alMars

   alMars sumarConCoordenada:(0@-1)! !

!Norte methodsFor: 'acciones' stamp: 'jh 11/16/2021 13:30:04'!
rotacionALaDerechaDe: unMars

  ^ unMars cambiarSentido: Oeste new.! !

!Norte methodsFor: 'acciones' stamp: 'jh 11/16/2021 13:30:19'!
rotacionALaIzquierdaDe: unMars

  ^ unMars cambiarSentido: Este new.! !


!classDefinition: #Oeste category: 'MarsRover-Refactor'!
Direccion subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!Oeste methodsFor: 'acciones' stamp: 'jh 11/13/2021 19:30:10'!
adelantar:alMars

  alMars sumarConCoordenada:(1@0)! !

!Oeste methodsFor: 'acciones' stamp: 'jh 11/13/2021 19:30:19'!
retrasar: alMars

   alMars sumarConCoordenada:(-1@0)! !

!Oeste methodsFor: 'acciones' stamp: 'jh 11/16/2021 13:30:28'!
rotacionALaDerechaDe: unMars

  ^ unMars cambiarSentido: Sur new.! !

!Oeste methodsFor: 'acciones' stamp: 'jh 11/16/2021 13:30:34'!
rotacionALaIzquierdaDe: unMars

  ^ unMars cambiarSentido: Norte new.! !


!classDefinition: #Sur category: 'MarsRover-Refactor'!
Direccion subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!Sur methodsFor: 'acciones' stamp: 'jh 11/13/2021 19:29:39'!
adelantar: alMars

  alMars sumarConCoordenada:(0@-1).! !

!Sur methodsFor: 'acciones' stamp: 'jh 11/13/2021 19:29:57'!
retrasar: alMars

  alMars sumarConCoordenada:(0@1).! !

!Sur methodsFor: 'acciones' stamp: 'jh 11/16/2021 13:30:45'!
rotacionALaDerechaDe: unMars

  ^ unMars cambiarSentido: Este new.! !

!Sur methodsFor: 'acciones' stamp: 'jh 11/16/2021 13:30:55'!
rotacionALaIzquierdaDe: unMars

  ^ unMars cambiarSentido: Oeste new.! !


!classDefinition: #Instruccion category: 'MarsRover-Refactor'!
Object subclass: #Instruccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!Instruccion methodsFor: 'validacion' stamp: 'jh 11/12/2021 21:40:14'!
validar: unaLetra

  self subclassResponsibility.! !


!Instruccion methodsFor: 'movimiento' stamp: 'jh 11/13/2021 19:22:32'!
movera: unMars 

 self subclassResponsibility.! !


!classDefinition: #Adelante category: 'MarsRover-Refactor'!
Instruccion subclass: #Adelante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!Adelante methodsFor: 'validacion' stamp: 'jh 11/12/2021 22:06:55'!
validar: unaLetra

  ^ (unaLetra = $f).! !


!Adelante methodsFor: 'movimiento' stamp: 'jh 11/13/2021 19:23:29'!
movera: unMars 

   unMars moverHaciaAdelante.! !


!classDefinition: #Atras category: 'MarsRover-Refactor'!
Instruccion subclass: #Atras
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!Atras methodsFor: 'validacion' stamp: 'jh 11/12/2021 22:06:24'!
validar: unaLetra

  ^ (unaLetra = $b).! !


!Atras methodsFor: 'movimiento' stamp: 'jh 11/13/2021 19:23:04'!
movera: unMars

    unMars moverHaciaAtras.
  ! !


!classDefinition: #RotacionDerecha category: 'MarsRover-Refactor'!
Instruccion subclass: #RotacionDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!RotacionDerecha methodsFor: 'movimiento' stamp: 'jh 11/13/2021 19:24:10'!
movera: unMars

  unMars rotacionALaDerecha.! !


!RotacionDerecha methodsFor: 'validacion' stamp: 'jh 11/12/2021 22:07:23'!
validar: unaLetra

  ^ (unaLetra = $r).! !


!classDefinition: #RotacionIzquierda category: 'MarsRover-Refactor'!
Instruccion subclass: #RotacionIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!RotacionIzquierda methodsFor: 'movimiento' stamp: 'jh 11/13/2021 19:23:49'!
movera: unMars

  unMars rotacionALaIzquierda.

! !


!RotacionIzquierda methodsFor: 'validacion' stamp: 'jh 11/12/2021 22:07:12'!
validar: unaLetra

  ^ (unaLetra = $l).! !


!classDefinition: #MarsRover category: 'MarsRover-Refactor'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordenadas direccionDondeApunta movimientosPosibles coordenadasConocidas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Refactor'!

!MarsRover methodsFor: 'public' stamp: 'jh 11/12/2021 20:16:29'!
apuntaHacia

   ^ direccionDondeApunta class.! !

!MarsRover methodsFor: 'public' stamp: 'jh 11/16/2021 13:29:35'!
cambiarSentido: nuevoSentido

  direccionDondeApunta := nuevoSentido
   ! !

!MarsRover methodsFor: 'public' stamp: 'jh 11/12/2021 16:38:02'!
coordenadasActuales

  ^ coordenadas.! !

!MarsRover methodsFor: 'public' stamp: 'jh 11/12/2021 20:21:16'!
sumarConCoordenada: coordenadasASumar
 
    coordenadas := coordenadas + coordenadasASumar.

  ! !


!MarsRover methodsFor: 'movimientos' stamp: 'jh 11/13/2021 19:31:25'!
moverHaciaAdelante 

  direccionDondeApunta adelantar: self! !

!MarsRover methodsFor: 'movimientos' stamp: 'jh 11/13/2021 19:28:46'!
moverHaciaAtras

  direccionDondeApunta retrasar:self.

 ! !

!MarsRover methodsFor: 'movimientos' stamp: 'jh 11/16/2021 13:25:49'!
moveteA: unasCoordenadas

   unasCoordenadas do:[:x| self buscarCoordenada: x].
 
 
   

 ! !

!MarsRover methodsFor: 'movimientos' stamp: 'jh 11/13/2021 19:29:00'!
rotacionALaDerecha

   direccionDondeApunta rotacionALaDerechaDe: self! !

!MarsRover methodsFor: 'movimientos' stamp: 'jh 11/13/2021 19:28:50'!
rotacionALaIzquierda

  direccionDondeApunta rotacionALaIzquierdaDe: self! !


!MarsRover methodsFor: 'private' stamp: 'jh 11/13/2021 19:22:18'!
buscarCoordenada: string

  |accionValida|

  accionValida := coordenadasConocidas detect:[:x | x validar: string] ifNone:[ Error signal: self class errorCoordenada].
  accionValida movera: self  ! !

!MarsRover methodsFor: 'private' stamp: 'jh 11/12/2021 16:57:04'!
coordenadas: unasCoordenadas apuntandoHacia: direccion

   coordenadas := unasCoordenadas.
   direccionDondeApunta := direccion.! !

!MarsRover methodsFor: 'private' stamp: 'jh 11/16/2021 13:39:02'!
initialize

  coordenadasConocidas := OrderedCollection with: (RotacionIzquierda new) with: (RotacionDerecha new) with: (Atras new) with:(Adelante new).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Refactor'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'jh 11/12/2021 16:27:39'!
conCoordenadas: unasCoordenadas apuntando: direccion

  ^ self new coordenadas: unasCoordenadas apuntandoHacia: direccion.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'jh 11/12/2021 23:49:41'!
errorCoordenada

 ^ 'Error Coordenada Invalida'! !
