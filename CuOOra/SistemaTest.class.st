Class {
	#name : #SistemaTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'topico1',
		'topico2',
		'jorge',
		'unosTopicos'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
SistemaTest >> setUp [
	cuoora:= Sistema cargarDatos.
	jorge:= Usuario usuario: 'jorge' contrasena: 'testeando'.
	cuoora agregarUsuario: jorge.
	

]

{ #category : #tests }
SistemaTest >> testBuscarTopicoPorNombre [
	self assert: (cuoora buscarTopicoPorNombre: 'OO1').
	self deny: (cuoora buscarTopicoPorNombre: 'OO2').
]

{ #category : #tests }
SistemaTest >> testBuscarUsuarioPorNombre [
	self assert: (cuoora buscarUsuarioPorNombre: 'pedro@cuoora.com').
	self assert: (cuoora buscarUsuarioPorNombre: 'juan@cuoora.com').
	self deny: (cuoora buscarUsuarioPorNombre: 'usuarioQueNoEsta').
]

{ #category : #tests }
SistemaTest >> testCargarTopico [
	self assert: (cuoora buscarTopicoPorNombre: 'OO1').
]

{ #category : #tests }
SistemaTest >> testCargarUsuario [
	|user1|
	self assert: (cuoora buscarUsuarioPorNombre: 'pedro@cuoora.com').
	self assert: (cuoora buscarUsuarioPorNombre: 'juan@cuoora.com').
	self deny: (cuoora buscarUsuarioPorNombre: 'usuarioQueNoEsta').
	user1:= Usuario new usuario: 'alf'; contrasena: 'alf'.
	cuoora agregarUsuario: user1.
	self assert: (cuoora buscarUsuarioPorNombre: 'alf').
]
