"
Instance Variables
	descripcion:		    <String>
	nombre:		       <String>
	preguntasDeTopico:	 <OrderedCollection>
"
Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion',
		'preguntasDeTopico'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'as yet unclassified' }
Topico class >> nombre:unNombre descripcion:unaDescripcion [

^self new inicializar: unNombre descripcion:unaDescripcion.
]

{ #category : #methods }
Topico >> agregarPregunta: unaPregunta [

preguntasDeTopico add: unaPregunta .
]

{ #category : #methods }
Topico >> borrarPregunta: unaPregunta [
	preguntasDeTopico remove: unaPregunta.
]

{ #category : #accessing }
Topico >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Topico >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #initialize }
Topico >> inicializar: unNombre descripcion:unaDescripcion [
	preguntasDeTopico:= OrderedCollection new.
	nombre:= unNombre.
	descripcion:= unaDescripcion.
	
]

{ #category : #initialize }
Topico >> initialize [
	preguntasDeTopico:= OrderedCollection new.
	
]

{ #category : #accessing }
Topico >> nombre [
	^ nombre
]

{ #category : #accessing }
Topico >> nombre: anObject [
	nombre := anObject
]

{ #category : #accessing }
Topico >> preguntasDeTopico [
	^ preguntasDeTopico
]
