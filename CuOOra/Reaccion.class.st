"
Instance Variables
	fechaCreacion:		<Date>
	horaCreacion:		<Time>
	origen:				<Post>
	userReaccion:		<Usuario>
	valor:					<Boolean>
"
Class {
	#name : #Reaccion,
	#superclass : #Object,
	#instVars : [
		'valor',
		'fechaCreacion',
		'horaCreacion',
		'origen',
		'userReaccion'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'as yet unclassified' }
Reaccion class >> userReaccion: unUsuario valor: unValor origen: unPost [
^self new inicializar: unUsuario  valor:unValor origen: unPost.
]

{ #category : #accessing }
Reaccion >> fechaCreacion [
	^ fechaCreacion
]

{ #category : #accessing }
Reaccion >> fechaCreacion: anObject [
	fechaCreacion := anObject
]

{ #category : #accessing }
Reaccion >> horaCreacion [
	^ horaCreacion
]

{ #category : #accessing }
Reaccion >> horaCreacion: anObject [
	horaCreacion := anObject
]

{ #category : #initalize }
Reaccion >> inicializar: unUsuario  valor:unValor origen: unPost [
	userReaccion:= unUsuario.
	valor:= unValor.
	origen:= unPost.
	fechaCreacion:= Date today.
	horaCreacion:= Time now.
]

{ #category : #initalize }
Reaccion >> initialize [
	fechaCreacion:= Date today.
	horaCreacion:= Time now.
]

{ #category : #accessing }
Reaccion >> origen [
	^ origen
]

{ #category : #accessing }
Reaccion >> origen: anObject [
	origen := anObject
]

{ #category : #accessing }
Reaccion >> userReaccion [
	^ userReaccion
]

{ #category : #accessing }
Reaccion >> userReaccion: anObject [
	userReaccion := anObject
]

{ #category : #accessing }
Reaccion >> valor [
	^ valor
]

{ #category : #accessing }
Reaccion >> valor: anObject [
	valor := anObject
]
