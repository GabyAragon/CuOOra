"
Instance Variables
	descripcion:	 <String>
	respuestas:	 <OrderedCollection>
	titulo:		 <String>
	topicos:		 <OrderedCollection>
"
Class {
	#name : #Pregunta,
	#superclass : #Post,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos',
		'respuestas'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'as yet unclassified' }
Pregunta class >> topicos: algunosTopicos titulo: unTitulo descripcion: unaDescripcion creador:unUsuario [ 
	^self new inicializar: algunosTopicos  titulo:unTitulo  descripcion: unaDescripcion  creador: unUsuario .   
]

{ #category : #methods }
Pregunta >> agregarRespuesta: unaRespuesta [
"Se usa solo para el test de orden"
	respuestas add: unaRespuesta.
]

{ #category : #deleting }
Pregunta >> borrar [
	respuestas do: [:respuesta| respuesta borrarDeUsuario].
	respuestas removeAll.
	topicos do: [:topic|topic borrarPregunta:self].
]

{ #category : #'as yet unclassified' }
Pregunta >> contieneRespuesta: textoRespuesta [
"Se usa en tests"
	^respuestas anySatisfy: [:answer|answer texto = textoRespuesta]
]

{ #category : #methods }
Pregunta >> crearRespuesta: unTexto deUsuario: unUsuario [ 
	|respuesta|
	respuesta := Respuesta preguntaOrigen: self texto: unTexto creador: unUsuario.
	unUsuario agregarRespuesta: respuesta .
	respuestas add: respuesta .
	


]

{ #category : #accessing }
Pregunta >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Pregunta >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #initialize }
Pregunta >> inicializar: algunosTopicos  titulo:unTitulo  descripcion: unaDescripcion  creador: unUsuario [ 
	super initialize.
	respuestas:= OrderedCollection new.
	topicos:= OrderedCollection new.
	topicos:= algunosTopicos.
	titulo:=unTitulo.
	descripcion := unaDescripcion.
	creador := unUsuario.
]

{ #category : #initialize }
Pregunta >> initialize [
	super initialize.
	respuestas:= OrderedCollection new.
	topicos:= OrderedCollection new.
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas
]

{ #category : #accessing }
Pregunta >> respuestas: anObject [
	respuestas := anObject
]

{ #category : #'as yet unclassified' }
Pregunta >> respuestasOrdenadas [
	^respuestas asSortedCollection: [:respuesta1 :respuesta2|(respuesta1 diferenciaDeReacciones) > (respuesta2 diferenciaDeReacciones)].
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #accessing }
Pregunta >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]

{ #category : #accessing }
Pregunta >> topicos: anObject [
	topicos := anObject
]
