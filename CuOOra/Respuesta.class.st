"
Instance Variables
	preguntaOrigen:	 <Pregunta>
	texto:		       <String>

"
Class {
	#name : #Respuesta,
	#superclass : #Post,
	#instVars : [
		'texto',
		'preguntaOrigen'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'as yet unclassified' }
Respuesta class >> preguntaOrigen: unaPregunta texto: unTexto creador: unUsuario [ 
^self new inicializar: unaPregunta texto:unTexto creador: unUsuario.
]

{ #category : #deleting }
Respuesta >> borrarDeUsuario [
	creador borrarRespuesta: self.
]

{ #category : #initialize }
Respuesta >> inicializar: unaPregunta texto:unTexto creador: unUsuario [
	texto:= unTexto.
	creador:= unUsuario.
	preguntaOrigen:= unaPregunta.
	super initialize.
]

{ #category : #initialize }
Respuesta >> initialize [ 
	super initialize.
]

{ #category : #accessing }
Respuesta >> preguntaOrigen [
	^ preguntaOrigen
]

{ #category : #accessing }
Respuesta >> preguntaOrigen: anObject [
	preguntaOrigen := anObject
]

{ #category : #accessing }
Respuesta >> texto [
	^ texto
]

{ #category : #accessing }
Respuesta >> texto: anObject [
	texto := anObject
]
