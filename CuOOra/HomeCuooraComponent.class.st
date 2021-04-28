Class {
	#name : #HomeCuooraComponent,
	#superclass : #WAComponent,
	#instVars : [
		'preguntas'
	],
	#category : #'CuOOra-UI'
}

{ #category : #'as yet unclassified' }
HomeCuooraComponent >> botonDislike:aCanvas conPost: unPost [

aCanvas anchor callback: [ self contadorDislikes: unPost ];
					with: 'Dislike'
]

{ #category : #'as yet unclassified' }
HomeCuooraComponent >> botonLike:aCanvas conPost: unPost [

aCanvas anchor callback: [ self contadorLikes: unPost ];
					with: 'Like'
]

{ #category : #rendering }
HomeCuooraComponent >> cancelar [

self subclassResponsibility
]

{ #category : #'as yet unclassified' }
HomeCuooraComponent >> contadorDislikes: unPost [

unPost anadirReaccion: self session user valor: false
]

{ #category : #'as yet unclassified' }
HomeCuooraComponent >> contadorLikes: unPost [

unPost anadirReaccion: self session user valor: true
	
]

{ #category : #rendering }
HomeCuooraComponent >> guardar [

self subclassResponsibility
]

{ #category : #'as yet unclassified' }
HomeCuooraComponent >> logout [
 self session logout .
 self show:LoginComponent new.
]

{ #category : #'as yet unclassified' }
HomeCuooraComponent >> ordenarYDevolverCinco [

|preguntasRelevantes|

preguntasRelevantes := (self session user preguntasRelevantes) asSortedCollection: [ :a :b | a fechaYHoraDeCreacion > b fechaYHoraDeCreacion ].

preguntas:= preguntasRelevantes takeFirst: 5.

^preguntas
]

{ #category : #'as yet unclassified' }
HomeCuooraComponent >> procededFormularioNuevaPregunta [  
	self call: FormularioNuevaPreguntaComponent new.
]

{ #category : #'as yet unclassified' }
HomeCuooraComponent >> procededPerfilDeUsuario: unPost [
self call: (PerfilDeUsuarioComponent new post:unPost; yourself).

]

{ #category : #private }
HomeCuooraComponent >> proceedVerRespuestas: unaPregunta [ 
	self call: (RespuestasComponent new pregunta: unaPregunta; yourself)
]

{ #category : #rendering }
HomeCuooraComponent >> renderAgregarNuevaPreguntaButtonOn: aCanvas [
	aCanvas anchor 
		callback: [self procededFormularioNuevaPregunta ];
		with:[ aCanvas button with:'Hacer una Nueva Pregunta']
]

{ #category : #rendering }
HomeCuooraComponent >> renderBotonCancelar: aCanvas [

	aCanvas submitButton
		callback: [ self cancelar  ];
		with: 'Cancelar'
]

{ #category : #rendering }
HomeCuooraComponent >> renderBotonGuardar: aCanvas [

	aCanvas submitButton
		callback: [ self guardar ];
		with: 'Guardar'.
		

]

{ #category : #rendering }
HomeCuooraComponent >> renderButtonLogOut:aCanvas [

	aCanvas anchor
		callback: [ self logout ];
		with: 'Logout'
]

{ #category : #rendering }
HomeCuooraComponent >> renderButtonsOn: aCanvas [

self renderBotonGuardar: aCanvas.
aCanvas space.
self renderBotonCancelar: aCanvas .
]

{ #category : #rendering }
HomeCuooraComponent >> renderContadorDeReacciones: aCanvas conPost: unPost [

aCanvas paragraph:  ((unPost contarLikes asString ), ' likes | ',((unPost contarDislikes asString  ), ' dislikes'  )).
]

{ #category : #rendering }
HomeCuooraComponent >> renderContentOn: aCanvas [
	self renderHeadOn: aCanvas.
	self renderAgregarNuevaPreguntaButtonOn: aCanvas.
	self renderUltimasPreguntasOn: aCanvas.
]

{ #category : #rendering }
HomeCuooraComponent >> renderEnlaceAPerfilDeUsuario:aCanvas con: unPost [

	
			aCanvas anchor
				callback: [ self procededPerfilDeUsuario: unPost  ];
				with: unPost creador usuario.
]

{ #category : #rendering }
HomeCuooraComponent >> renderEnlaceDePregunta: aCanvas con: unaPregunta [
	aCanvas
		paragraph: [ aCanvas horizontalRule.
			aCanvas anchor
				callback: [ self proceedVerRespuestas: unaPregunta  ];
				with: unaPregunta titulo ]
]

{ #category : #rendering }
HomeCuooraComponent >> renderHeadOn: aCanvas [

	aCanvas heading: 'CuOOra ' , self session user usuario .
	self renderButtonLogOut:aCanvas .
	aCanvas horizontalRule .
]

{ #category : #rendering }
HomeCuooraComponent >> renderLikesYDislikes: aCanvas conPost: unPost [
	self renderContadorDeReacciones: aCanvas conPost: unPost.
	self botonLike: aCanvas conPost: unPost.
	aCanvas text: ' | '.
	self botonDislike: aCanvas conPost: unPost
]

{ #category : #rendering }
HomeCuooraComponent >> renderMostrarDatosDePreguntas: aCanvas con: unaPregunta [
	self renderEnlaceDePregunta: aCanvas con: unaPregunta.
	self renderTopicos:aCanvas con: unaPregunta . 
	aCanvas text:  'Realizada por '.
	self renderEnlaceAPerfilDeUsuario: aCanvas con: unaPregunta.
	aCanvas
		text: ' | ' , unaPregunta respuestas size asString , ' respuestas'.
	self renderLikesYDislikes: aCanvas conPost: unaPregunta
]

{ #category : #rendering }
HomeCuooraComponent >> renderTopicos:aCanvas con: unaPregunta [ . 
	
	aCanvas paragraph:[ aCanvas text: 'Topicos: | '.
	unaPregunta topicos do: [:each| aCanvas text: each nombre,' | ']].
]

{ #category : #rendering }
HomeCuooraComponent >> renderUltimasPreguntasOn: aCanvas [
	self ordenarYDevolverCinco.
	aCanvas heading
		level: 2;
		with: 'Ultimas Preguntas'.
	aCanvas
		orderedList: [ preguntas
				do: [ :each | 
					aCanvas
						listItem: [ self renderMostrarDatosDePreguntas: aCanvas con: each ] ] ].
	aCanvas horizontalRule
]
