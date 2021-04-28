Class {
	#name : #FormularioNuevaPreguntaComponent,
	#superclass : #HomeCuooraComponent,
	#instVars : [
		'nuevaPregunta',
		'titulo',
		'desarrollo',
		'topicos'
	],
	#category : #'CuOOra-UI'
}

{ #category : #rendering }
FormularioNuevaPreguntaComponent >> cancelar [
 
	self answer.
]

{ #category : #'as yet unclassified' }
FormularioNuevaPreguntaComponent >> coleccionDeStringsAcoleccionDeTopicos [
|topicosComoObjeto|

topicosComoObjeto:= OrderedCollection new.

	topicos do: [:topicoString | topicosComoObjeto add: (Sistema soleInstance topicos detect: [ :topicoDelSistema | topicoDelSistema nombre = topicoString ] ifNone: [ self error: 'No existe el topico'])].
	
	topicos:= topicosComoObjeto .
]

{ #category : #rendering }
FormularioNuevaPreguntaComponent >> guardar [
	titulo ifEmpty: [^self].
	self separarTopicos.
	self session user crearPregunta: titulo  descripcion: desarrollo  topicos: topicos.
	self answer.
]

{ #category : #'instance creation' }
FormularioNuevaPreguntaComponent >> newDesarrollo [
^ desarrollo .
]

{ #category : #'instance creation' }
FormularioNuevaPreguntaComponent >> newDesarrollo: unString [
desarrollo := unString .
]

{ #category : #'instance creation' }
FormularioNuevaPreguntaComponent >> newTitulo [
^ titulo.
]

{ #category : #'instance creation' }
FormularioNuevaPreguntaComponent >> newTitulo: unString [
titulo:= unString .
]

{ #category : #'instance creation' }
FormularioNuevaPreguntaComponent >> newTopicos [
^ topicos.
]

{ #category : #'instance creation' }
FormularioNuevaPreguntaComponent >> newTopicos: unString [
topicos:= unString .
]

{ #category : #rendering }
FormularioNuevaPreguntaComponent >> renderContentOn: aCanvas [

self renderHeadOn: aCanvas.
	aCanvas heading
		level: 2;
		with: 'NuevaPregunta'.
		
self renderFormularioDeNuevaPregunta: aCanvas.
]

{ #category : #rendering }
FormularioNuevaPreguntaComponent >> renderFormularioDeNuevaPregunta: aCanvas [.

aCanvas
		form: [ self renderInputPreguntaOn: aCanvas.
			self renderButtonsOn: aCanvas ]
]

{ #category : #rendering }
FormularioNuevaPreguntaComponent >> renderInputPreguntaOn: aCanvas [

aCanvas label: ' Titulo '.
	aCanvas paragraph: [ (aCanvas textInput on: #newTitulo of: self) ].
			
		aCanvas label: 'Desarrollo'.
	aCanvas paragraph: [ (aCanvas textArea on: #newDesarrollo of: self)columns: 80;
				rows: 5.   ].
	aCanvas label: 'Topicos'.
	aCanvas paragraph: [ (aCanvas textInput on: #newTopicos of: self ; size:30)value:'Ingrese topicos separados por coma']
]

{ #category : #'as yet unclassified' }
FormularioNuevaPreguntaComponent >> separarTopicos [

	topicos := topicos asString substrings: ','.

	
	self coleccionDeStringsAcoleccionDeTopicos.
	

]
