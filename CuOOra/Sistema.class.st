"
Instance Variables
	topicos:		<OrderedCollection>
	usuarios:		<OrderedCollection>
"
Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'topicos',
		'usuarios'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'CuOOra-Model'
}

{ #category : #'instance creation' }
Sistema class >> cargarDatos [
|cuoora pedro diego juan topico1 topico2 topico3 topicosInteresPedro topicosInteresDiego topicosInteresJuan topicospreguntaPedro topicospreguntaDiego preguntaPedro preguntaDiego| 
 
cuoora:= self  new.

topico1:= Topico new nombre: 'OO1'; descripcion: 'Temas de objetos'.
topico2:= Topico new nombre: 'Test de unidad'; descripcion: 'Temas de test'.
topico3:= Topico new nombre: 'SmallTalk';descripcion: 'Temas de SmallTalk'.

cuoora agregarTopico: topico1.
cuoora agregarTopico: topico2.
cuoora agregarTopico: topico3.
 
topicospreguntaPedro := OrderedCollection new.
topicospreguntaPedro add:topico1 ; add: topico2.
topicospreguntaDiego := OrderedCollection new.
topicospreguntaDiego  add:topico1; add: topico3.

topicosInteresPedro:= OrderedCollection new.
topicosInteresPedro add: topico1.
topicosInteresDiego:= OrderedCollection new.
topicosInteresDiego add: topico2.
topicosInteresJuan:= OrderedCollection new.
topicosInteresJuan add: topico3.

pedro:= Usuario new usuario: 'pedro@cuoora.com'; contrasena: 'pedro@cuoora.com' .
diego:= Usuario new usuario: 'diego@cuoora.com'; contrasena: 'diego@cuoora.com' .
juan:=  Usuario new usuario: 'juan@cuoora.com'; contrasena: 'juan@cuoora.com' .

cuoora agregarUsuario: pedro. 
cuoora agregarUsuario: diego.
cuoora agregarUsuario: juan.

juan seguir: diego .
pedro seguir: juan .

preguntaPedro  :=  pedro crearPregunta: 'Para que sirve el metodo SetUp?'  descripcion:'Se requiere implementar en un Test Case'  topicos:topicospreguntaPedro .

preguntaDiego :=  diego crearPregunta: 'Que significa #messageNotUnderstood?'  descripcion:'No puedo implementar un metodo'  topicos:topicospreguntaDiego .


preguntaPedro crearRespuesta: ' Sirve para instanciar los objetos que son evaluados por el test en un unico metodo y que se ejecute siempre antes de cada test.' deUsuario:  diego.


preguntaDiego crearRespuesta:'Significa que el objeto que recibio el mensaje no encontre ningun metodo para ejecutar en respuesta.'  deUsuario:pedro.

preguntaDiego anadirReaccion: pedro valor: true  .


^ cuoora

]

{ #category : #'instance creation' }
Sistema class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #'instance creation' }
Sistema class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := (self cargarDatos) ]
]

{ #category : #'as yet unclassified' }
Sistema >> agregarTopico: unTopico [
	
	topicos add: unTopico.
]

{ #category : #accessing }
Sistema >> agregarUsuario: unUsuario [
	usuarios add: unUsuario.
]

{ #category : #'as yet unclassified' }
Sistema >> buscarTopicoPorNombre: unNombre [
"Usa en tests"
	^topicos anySatisfy: [:topic|topic nombre = unNombre].
	
]

{ #category : #'as yet unclassified' }
Sistema >> buscarUsuarioPorNombre: unNombre [
"Usa para testear"
	^usuarios anySatisfy: [:user|user usuario = unNombre].
	
]

{ #category : #processing }
Sistema >> crearUsuario: unUsuario contrasena:unaContrasena [
	(usuarios anySatisfy: [:user|user usuario=unUsuario]) ifFalse: [usuarios add: (Usuario new usuario: unUsuario;contrasena: unaContrasena)].
]

{ #category : #initialize }
Sistema >> initialize [
	usuarios:= OrderedCollection new.
	topicos:= OrderedCollection new.
]

{ #category : #accessing }
Sistema >> topicos [
	^ topicos
]

{ #category : #accessing }
Sistema >> topicos: anObject [
	topicos := anObject
]

{ #category : #utility }
Sistema >> userWithNombre: aNombre protectedBy: aPassword [
	^ self usuarios
		detect: [ :each | each usuario = aNombre & (each contrasena = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
Sistema >> usuarios [
	^ usuarios
]

{ #category : #accessing }
Sistema >> usuarios: anObject [
	usuarios := anObject
]
