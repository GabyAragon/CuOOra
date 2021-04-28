Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'unTopico',
		'user1',
		'unaPregunta',
		'user2',
		'preguntaParaTestearOrden',
		'user3',
		'user4',
		'respuesta1',
		'respuesta2',
		'respuesta3'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
PreguntaTest >> setUp [
	unTopico:=OrderedCollection new.
	unTopico add: (Topico nombre: 'Hola' descripcion: 'mina xd').
	user1:= Usuario usuario: 'Jorge' contrasena: 'Pepe'.
	user2:= Usuario usuario: '100tifiko' contrasena: 'ciencia'.
	user3:= Usuario usuario: 'Rick' contrasena: 'Morty'.
	user4:= Usuario usuario: 'Ryu' contrasena: 'Hadoken'.
	unaPregunta:= Pregunta topicos: unTopico titulo:'Smalltalk' descripcion: 'Como le hago para hackear pet society' creador: user1.
	unTopico first agregarPregunta: unaPregunta.
	unaPregunta crearRespuesta: 'No se' deUsuario: user2.
	unaPregunta respuestas first anadirReaccion: user1 valor: true .
	unaPregunta crearRespuesta: 'pa k kieres saber eso' deUsuario: user2.
	preguntaParaTestearOrden:= Pregunta topicos: unTopico titulo:'Como se usa cuoora' descripcion: 'aiuda'  creador: user2.
	respuesta1:= Respuesta preguntaOrigen: preguntaParaTestearOrden texto: 'Toca todos los botones' creador: user4 .
	respuesta2:= Respuesta preguntaOrigen: preguntaParaTestearOrden texto: 'No se' creador: user1 .
	respuesta3:= Respuesta preguntaOrigen: preguntaParaTestearOrden texto:  'si' creador: user3.
	respuesta1 anadirReaccion: user1 valor: true .
	respuesta3 anadirReaccion: user4 valor: false .
	preguntaParaTestearOrden agregarRespuesta: respuesta2.
	preguntaParaTestearOrden agregarRespuesta: respuesta3.
	preguntaParaTestearOrden agregarRespuesta: respuesta1.
]

{ #category : #tests }
PreguntaTest >> testBorrar [
	self assert: (unaPregunta respuestas isNotEmpty).
   self assert: (unTopico first preguntasDeTopico isNotEmpty).
	unaPregunta borrar.
	self assert: (unaPregunta respuestas isEmpty).
	self assert: (unTopico first preguntasDeTopico isEmpty).
]

{ #category : #tests }
PreguntaTest >> testConstructor [
	self assert: unaPregunta topicos size equals: 1.
	self assert: unaPregunta creador equals: user1.
	self assert: unaPregunta descripcion equals: 'Como le hago para hackear pet society'.
	self assert: unaPregunta titulo equals: 'Smalltalk'.
]

{ #category : #tests }
PreguntaTest >> testContieneRespuesta [

self assert: (unaPregunta contieneRespuesta: 'No se').
self deny: (unaPregunta contieneRespuesta: 'Si se pero no te wa a decir').
self assert: (unaPregunta contieneRespuesta: 'pa k kieres saber eso').
]

{ #category : #tests }
PreguntaTest >> testCrearRespuestaDeUsuario [
	self assert: (unaPregunta contieneRespuesta: 'No se').
]

{ #category : #tests }
PreguntaTest >> testRespuestasOrdenadas [
	self assert: preguntaParaTestearOrden respuestasOrdenadas first equals: respuesta1.
	self assert: preguntaParaTestearOrden respuestasOrdenadas last equals: respuesta3.
	"Para probar que las reordena hago los deny"
	self deny: preguntaParaTestearOrden respuestas first equals: respuesta1.
	self deny: preguntaParaTestearOrden respuestas last equals: respuesta3.

]
