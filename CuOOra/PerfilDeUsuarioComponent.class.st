Class {
	#name : #PerfilDeUsuarioComponent,
	#superclass : #HomeCuooraComponent,
	#instVars : [
		'post'
	],
	#category : #'CuOOra-UI'
}

{ #category : #'as yet unclassified' }
PerfilDeUsuarioComponent >> follow [

 self session user seguir: ( self post creador ).


  
]

{ #category : #accessing }
PerfilDeUsuarioComponent >> post [
	^ post
]

{ #category : #accessing }
PerfilDeUsuarioComponent >> post: unPost [ 

post:= unPost .
]

{ #category : #rendering }
PerfilDeUsuarioComponent >> renderContentOn: aCanvas [
	self renderHeadOn: aCanvas.
	self renderPreguntasDeUsuarioOn: aCanvas.
	self renderTodasLasPreguntasDelUsuario: aCanvas.
]

{ #category : #rendering }
PerfilDeUsuarioComponent >> renderEnlaceDeFollow: aCanvas [

aCanvas anchor 
		callback: [self follow];
		with:[ aCanvas button with:'Follow'] .
		

		
	
	
]

{ #category : #rendering }
PerfilDeUsuarioComponent >> renderPreguntasDeUsuarioOn: aCanvas [

	aCanvas heading
		level: 2;
		with: [aCanvas text: 'Preguntas de ', post creador usuario,' ' . self renderEnlaceDeFollow: aCanvas ].
		
	
]

{ #category : #rendering }
PerfilDeUsuarioComponent >> renderTodasLasPreguntasDelUsuario: aCanvas [.

post creador conocerPreguntas do:[:each | self renderMostrarDatosDePreguntas: aCanvas con:each ]
]
