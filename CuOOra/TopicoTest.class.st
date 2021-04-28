Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#instVars : [
		'user1',
		'unTopico',
		'unaPregunta',
		'unosTopicos'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
TopicoTest >> setUp [
	unosTopicos:=OrderedCollection new.
	user1:= Usuario usuario: 'Jorge' contrasena: 'Pepe'.
	unTopico:= Topico nombre: 'Cheats' descripcion: 'Tips y trucos para uso facil de un lenguaje o programa'.
	unosTopicos add: unTopico.
	user1 crearPregunta:  'Smalltalk' descripcion: 'Como le hago para hackear pet society' topicos: unosTopicos.
	unaPregunta:= user1 conocerPreguntas first.

]

{ #category : #tests }
TopicoTest >> testAgregarPregunta [
	self assert: unTopico preguntasDeTopico size equals:1.
	self assert: unTopico preguntasDeTopico first equals: unaPregunta.
]

{ #category : #tests }
TopicoTest >> testBorrarPregunta [
	self assert: unTopico preguntasDeTopico size equals:1.
	unTopico borrarPregunta: unaPregunta.
	self assert: unTopico preguntasDeTopico size equals:0.
]

{ #category : #tests }
TopicoTest >> testConstructor [
	self assert: unTopico nombre equals: 'Cheats'.
	self assert: unTopico descripcion equals: 'Tips y trucos para uso facil de un lenguaje o programa'.
]
