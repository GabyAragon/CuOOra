"
Instance Variables
	usuario:       <String>
	contrasena:    <String>
	fechaCreacion: <Date>
	horaCreacion:  <Time>
	posts:         <OrderedCollection>
	preguntas:     <OrderedCollection>
	reacciones:    <OrderedCollection>
	respuestas:    <OrderedCollection>
	seguidores:    <OrderedCollection>
	sigue:	         <OrderedCollection>
	topicosInteres:<OrderedCollection>
"
Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'contrasena',
		'fechaCreacion',
		'horaCreacion',
		'preguntas',
		'respuestas',
		'topicosInteres',
		'sigue'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'as yet unclassified' }
Usuario class >> usuario: unUsuario contrasena: unaContrasena [
	^self new inicializar: unUsuario contrasena: unaContrasena.
	
]

{ #category : #methods }
Usuario >> agregarPregunta: unaPregunta [ 
	preguntas add: unaPregunta.
]

{ #category : #methods }
Usuario >> agregarRespuesta: unaRespuesta [

	respuestas add: unaRespuesta
]

{ #category : #processing }
Usuario >> agregarTopicoInteres: unTopico [
topicosInteres add: unTopico.
]

{ #category : #deleting }
Usuario >> borrarPregunta: unaPregunta [
	preguntas remove: unaPregunta.
	unaPregunta borrar.
	
	
	
]

{ #category : #deleting }
Usuario >> borrarRespuesta: unaRespuesta [
	respuestas remove: unaRespuesta.
]

{ #category : #methods }
Usuario >> buscarSeguido: unUsuario [
"Usa para los tests"
	^sigue anySatisfy: [:user|user = unUsuario].
]

{ #category : #methods }
Usuario >> buscarTituloPregunta: unTexto [
	^preguntas anySatisfy: [ :question|question titulo = unTexto ].
]

{ #category : #processing }
Usuario >> calcularPuntaje [
	|puntos respuestasOtrasPreguntas|
	puntos:=0.
	puntos:= (20 * (self conocerPreguntas size)).
	puntos:=puntos + (self conocerPreguntas sumNumbers: [:pregunta|pregunta diferenciaDeReacciones]).
	respuestasOtrasPreguntas:= self conocerRespuestas reject: [:respuesta|respuesta creador = respuesta preguntaOrigen creador].
	puntos:= puntos + ((respuestasOtrasPreguntas size) * 50).
	puntos:=puntos + (respuestasOtrasPreguntas sumNumbers: [:respuesta|respuesta diferenciaDeReacciones]).
	^puntos.
	
	 
]

{ #category : #accessing }
Usuario >> conocerPreguntas [
	^ preguntas
]

{ #category : #accessing }
Usuario >> conocerRespuestas [
	^ respuestas
]

{ #category : #accessing }
Usuario >> contrasena [
	^ contrasena
]

{ #category : #accessing }
Usuario >> contrasena: anObject [
	contrasena := anObject
]

{ #category : #processing }
Usuario >> crearPregunta: unTitulo descripcion: unaDescripcion topicos: algunosTopicos [
|preguntaNueva|

	preguntaNueva :=Pregunta topicos: algunosTopicos titulo: unTitulo descripcion: unaDescripcion creador: self.
	preguntas add: preguntaNueva.
	
	algunosTopicos do: [ :topic | topic agregarPregunta: preguntaNueva ].
	
^ preguntaNueva 	
	
]

{ #category : #accessing }
Usuario >> fechaCreacion [
	^ fechaCreacion
]

{ #category : #accessing }
Usuario >> fechaCreacion: anObject [
	fechaCreacion := anObject
]

{ #category : #accessing }
Usuario >> horaCreacion [
	^ horaCreacion
]

{ #category : #accessing }
Usuario >> horaCreacion: anObject [
	horaCreacion := anObject
]

{ #category : #initialize }
Usuario >> inicializar: unUsuario contrasena: unaContrasena [
	usuario:= unUsuario.
	contrasena:= unaContrasena.
	fechaCreacion:= Date today.
	horaCreacion := Time now.
	preguntas:= OrderedCollection new.
	respuestas:=OrderedCollection new.
	topicosInteres:= OrderedCollection new.
	sigue:= OrderedCollection new.
]

{ #category : #initialize }
Usuario >> initialize [
	fechaCreacion:= Date today.
	horaCreacion := Time now.
	preguntas:= OrderedCollection new.
	respuestas:=OrderedCollection new.
	topicosInteres:= OrderedCollection new.
	sigue:= OrderedCollection new.
]

{ #category : #accessing }
Usuario >> preguntas: anObject [
	preguntas := anObject
]

{ #category : #processing }
Usuario >> preguntasRelevantes [
	|preguntasInteres|
	preguntasInteres:= OrderedCollection new.
	preguntasInteres:= topicosInteres flatCollect: [:topic|topic preguntasDeTopico].
	preguntasInteres addAll: (sigue flatCollect:[:user|user conocerPreguntas ]).
	preguntasInteres removeDuplicates.
	^preguntasInteres
]

{ #category : #accessing }
Usuario >> respuestas: anObject [
	respuestas := anObject
]

{ #category : #methods }
Usuario >> seguir: unUsuario [
	sigue add: unUsuario.
]

{ #category : #accessing }
Usuario >> sigue [
	^ sigue
]

{ #category : #accessing }
Usuario >> sigue: anObject [
	sigue := anObject
]

{ #category : #accessing }
Usuario >> topicosInteres [
	^ topicosInteres
]

{ #category : #accessing }
Usuario >> topicosInteres: anObject [
	topicosInteres := anObject
]

{ #category : #accessing }
Usuario >> usuario [
	^ usuario
]

{ #category : #accessing }
Usuario >> usuario: anObject [
	usuario := anObject
]
