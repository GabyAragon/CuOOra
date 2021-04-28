Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'unosTopicos',
		'user1',
		'user2',
		'user3',
		'unTopico',
		'unaPregunta'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
UsuarioTest >> setUp [
	unTopico:= Topico new.
	unosTopicos:= OrderedCollection new.
	unTopico:= (Topico nombre: 'Cheats' descripcion: 'Cheaterinos' ). 
	unosTopicos:=OrderedCollection new.
	unosTopicos add: unTopico.
	user1:= Usuario usuario: 'Jorge' contrasena: 'Pepe'.
	user2:= Usuario usuario: 'Candelita' contrasena: 'iaby'.
	user3:= Usuario usuario: 'iaby' contrasena: 'cande'.
	user1 crearPregunta: 'SonLosTestsComplicados?' descripcion: 'Ayudeme Porfavor' topicos: unosTopicos.
	user1 crearPregunta:  'Smalltalk' descripcion: 'Como le hago para hackear pet society' topicos: unosTopicos.
	user1 crearPregunta: 'CheatEngine' descripcion: 'Como Multiplicar queso skyrim' topicos: unosTopicos.
	unaPregunta:= user1 conocerPreguntas first.
	unaPregunta crearRespuesta: 'Si man, corre ' deUsuario: user2.
	unaPregunta crearRespuesta: 'ok ' deUsuario: user1.
	user1 crearPregunta: 'COMOINSTALOMINECRAFT' descripcion: 'Lo k dic el titulo'topicos: unosTopicos.
	user1 crearPregunta:  'Top10BestAnimeDeaths' descripcion: 'Top1:noVeoAnime'topicos: unosTopicos.
	user3 crearPregunta: 'HolaMeOlvideUnUsuario' descripcion: 'meOlvideQueTeniaQueChequearPorTopicoTambien' topicos: unosTopicos.
	user2 seguir: user1.
	unaPregunta anadirReaccion: user2 valor: true.
	unaPregunta anadirReaccion: user3 valor: true.
	user1 seguir: user2.
	user3 seguir: user2
]

{ #category : #tests }
UsuarioTest >> testBorrarPregunta [
	self assert: user1 conocerPreguntas size equals:5.
	self assert: user2 conocerRespuestas size equals:1.
	user1 borrarPregunta: unaPregunta.
	self assert: user1 conocerPreguntas size equals:4.
	self assert: user2 conocerRespuestas size equals:0.
	
]

{ #category : #tests }
UsuarioTest >> testBorrarRespuesta [
	|unaRespuesta|
	unaRespuesta:= unaPregunta respuestas first.
	self assert: unaRespuesta texto equals: 'Si man, corre '.
	self assert: (user2 conocerRespuestas anySatisfy:  [:each| each texto = 'Si man, corre ']).
	user2 borrarRespuesta: unaRespuesta.
	self deny: (user2 conocerRespuestas anySatisfy:  [:each| each texto = 'Si man, corre ']).
]

{ #category : #tests }
UsuarioTest >> testBuscarSeguido [

self assert: (user1 buscarSeguido: user2).
self deny: (user1 buscarSeguido: user3).
self assert: (user3 buscarSeguido: user2).
self deny: (user3 buscarSeguido: user1).
]

{ #category : #tests }
UsuarioTest >> testBuscarTituloDePregunta [
	self assert: (user1 buscarTituloPregunta: 'SonLosTestsComplicados?').
	self deny: (user1 buscarTituloPregunta: 'ComplicadosSonLosTests?').
]

{ #category : #tests }
UsuarioTest >> testBuscarTituloPregunta [
	self assert: (user1 buscarTituloPregunta: 'SonLosTestsComplicados?').
	self deny: (user1 buscarTituloPregunta: 'ComplicadosSonLosTests?').
]

{ #category : #tests }
UsuarioTest >> testCalcularPuntaje [
	self assert: user1 calcularPuntaje equals: 102.
	
]

{ #category : #tests }
UsuarioTest >> testConstructor [
	self assert: user1 usuario equals: 'Jorge'.
	self assert: user1 contrasena equals: 'Pepe'
]

{ #category : #tests }
UsuarioTest >> testCrearPreguntaDescripcionTopicos [
	self assert: (user1 buscarTituloPregunta: 'SonLosTestsComplicados?').
	self deny: (user1 buscarTituloPregunta: 'SonLosTestsFaciles?').
]

{ #category : #tests }
UsuarioTest >> testPreguntasRelevantes [
	self assert: user2 preguntasRelevantes size equals: 5.
	user2 agregarTopicoInteres: unTopico.
	self assert: user2 preguntasRelevantes size equals: 6.
]
