Class {
	#name : #FormularioNuevaRespuestaComponent,
	#superclass : #RespuestasComponent,
	#instVars : [
		'respuesta'
	],
	#category : #'CuOOra-UI'
}

{ #category : #'as yet unclassified' }
FormularioNuevaRespuestaComponent >> cancelar [
	pregunta := nil. 
	self answer.
]

{ #category : #rendering }
FormularioNuevaRespuestaComponent >> guardar [

	respuesta ifEmpty: [ ^ self ].

	pregunta crearRespuesta: respuesta deUsuario: self session user.
	self answer.
]

{ #category : #'instance creation' }
FormularioNuevaRespuestaComponent >> newRespuesta [

^ respuesta
]

{ #category : #'instance creation' }
FormularioNuevaRespuestaComponent >> newRespuesta: unaRespuesta [

respuesta:= unaRespuesta .
]

{ #category : #rendering }
FormularioNuevaRespuestaComponent >> renderContentOn: aCanvas [
	self renderHeadOn: aCanvas.
	self renderDetallePregunta: aCanvas.
	aCanvas
		form: [ self renderInputRespuestaOn: aCanvas.
			self renderButtonsOn: aCanvas ]
]

{ #category : #rendering }
FormularioNuevaRespuestaComponent >> renderInputRespuestaOn: aCanvas [

   aCanvas label: ' RESPONDER '.
	aCanvas paragraph: [ (aCanvas textArea on: #newRespuesta of: self) columns: 80;
				rows: 5. ]
]
