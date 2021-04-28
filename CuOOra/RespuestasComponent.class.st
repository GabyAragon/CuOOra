Class {
	#name : #RespuestasComponent,
	#superclass : #HomeCuooraComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'CuOOra-UI'
}

{ #category : #accessing }
RespuestasComponent >> pregunta [
	^ pregunta
]

{ #category : #accessing }
RespuestasComponent >> pregunta: anObject [
	pregunta := anObject
]

{ #category : #'as yet unclassified' }
RespuestasComponent >> procededFormularioNuevaRespuesta: unaPregunta [
	self call: (FormularioNuevaRespuestaComponent new pregunta: unaPregunta; yourself ).
]

{ #category : #rendering }
RespuestasComponent >> renderAgregarNuevaRespuestaButtonOn:aCanvas [
	aCanvas anchor 
		callback: [self procededFormularioNuevaRespuesta: pregunta ];
		with:[ aCanvas button with:'Agregar Respuesta']
]

{ #category : #rendering }
RespuestasComponent >> renderContentOn: aCanvas [

	self renderHeadOn: aCanvas.
	self renderDetallePregunta: aCanvas.

	self renderRespuestas: aCanvas.
	self renderAgregarNuevaRespuestaButtonOn: aCanvas.
]

{ #category : #rendering }
RespuestasComponent >> renderDetallePregunta: aCanvas [
	aCanvas paragraph: pregunta titulo.
	aCanvas text: 'Realizada por '.
	self renderEnlaceAPerfilDeUsuario: aCanvas con: pregunta.
	self renderLikesYDislikes: aCanvas conPost: pregunta.
	aCanvas horizontalRule.
	
]

{ #category : #rendering }
RespuestasComponent >> renderRespuestas: aCanvas [
	aCanvas
		unorderedList: [ pregunta respuestas
				do: [ :each | 
					aCanvas
						listItem: [ 	aCanvas text: 'Respuesta de '.self renderEnlaceAPerfilDeUsuario: aCanvas con: each ].
					aCanvas paragraph: each texto.
					self renderLikesYDislikes: aCanvas conPost: each.
					aCanvas horizontalRule ] ].
	aCanvas footer

		with: 'NO HAY MAS RESPUESTAS '
]
