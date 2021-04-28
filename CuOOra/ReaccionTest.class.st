Class {
	#name : #ReaccionTest,
	#superclass : #TestCase,
	#instVars : [
		'unTopico',
		'user1',
		'user2',
		'unaPregunta',
		'testReaccion'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
ReaccionTest >> setUp [
	unTopico:=OrderedCollection new.
	unTopico add: (Topico nombre: 'Hola' descripcion: 'mina xd').
	user1:= Usuario usuario: 'Jorge' contrasena: 'Pepe'.
	user2:= Usuario usuario: 'KONODIODA' contrasena: '111...1'.
	unaPregunta:= Pregunta topicos: unTopico titulo:'Smalltalk' descripcion: 'Como le hago para hackear pet society' creador: user2.
	testReaccion:= Reaccion userReaccion: user1  valor: true origen: unaPregunta.

]

{ #category : #'accessing-testing' }
ReaccionTest >> testConstructor [
	self assert: testReaccion valor equals: true.
	self assert: testReaccion origen equals: unaPregunta.
	self assert: testReaccion userReaccion equals: user1.
]
