Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#instVars : [
		'unTopico',
		'user1',
		'user2',
		'unaPregunta',
		'unaRespuesta'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
RespuestaTest >> setUp [
	unTopico:=OrderedCollection new.
	unTopico add: (Topico nombre: 'Hola' descripcion: 'mina xd').
	user1:= Usuario usuario: 'Jorge' contrasena: 'Pepe'.
	user2:= Usuario usuario: 'KONODIODA' contrasena: '111...1'.
	unaPregunta:= Pregunta topicos: unTopico titulo:'Smalltalk' descripcion: 'Como le hago para hackear pet society' creador: user1.
	unaRespuesta:= Respuesta preguntaOrigen: unaPregunta texto: 'pa k kieres saber eso jaja salu2'  creador: user2.
	user2 agregarRespuesta: unaRespuesta.
]

{ #category : #tests }
RespuestaTest >> testBorrardeUsuario [
	self assert: unaRespuesta texto equals: 'pa k kieres saber eso jaja salu2'.
	self assert: (user2 conocerRespuestas anySatisfy:  [:each| each texto = 'pa k kieres saber eso jaja salu2']).
	unaRespuesta borrarDeUsuario.
	self deny: (user2 conocerRespuestas anySatisfy:  [:each| each texto = 'pa k kieres saber eso jaja salu2']).
]

{ #category : #tests }
RespuestaTest >> testConstructor [	
	self assert: unaRespuesta texto equals: 'pa k kieres saber eso jaja salu2'.
	self assert: unaRespuesta creador equals: user2.
	self assert: unaRespuesta preguntaOrigen equals: unaPregunta.
	
]
