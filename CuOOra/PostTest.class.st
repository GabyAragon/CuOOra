Class {
	#name : #PostTest,
	#superclass : #TestCase,
	#instVars : [
		'user1',
		'user2',
		'user3',
		'user4',
		'user5',
		'post'
	],
	#category : #'CuOOra-Tests'
}

{ #category : #running }
PostTest >> setUp [	
	user1:= Usuario usuario: 'Jorge' contrasena: 'Pepe'.
	user2:= Usuario usuario: 'KONODIODA' contrasena: '111...1'.
	user3:= Usuario usuario: 'Juan' contrasena: '111...1'.
	user4:= Usuario usuario: 'MeDiCuentaQueAlguienVaALeerMisBoludeces' contrasena: '111...1'.
	user5:= Usuario usuario: 'PerdonPersonaQueCorrije' contrasena: '111...1'.
	post:= Post new.
	post anadirReaccion: user1  valor: true.
	post anadirReaccion: user2  valor: false.
	post anadirReaccion: user3  valor: false.
	post anadirReaccion: user4  valor: true.
	post anadirReaccion: user5  valor: true.

]

{ #category : #tests }
PostTest >> testAnadirReaccionValor [
	self assert: post reacciones size equals: 5.
	self assert: (post reacciones select: [:each| each valor]) size equals: 3.
	self assert: (post reacciones reject: [:each| each valor]) size equals: 2.
	 
	
]

{ #category : #tests }
PostTest >> testBorrarReaccionPrevia [
	post borrarReaccionPrevia: user1.
	self assert: post reacciones isNotEmpty.
	post borrarReaccionPrevia: user2.
	post borrarReaccionPrevia: user3.
	post borrarReaccionPrevia: user4.
	post borrarReaccionPrevia: user5.
	self assert: post reacciones isEmpty.
]

{ #category : #tests }
PostTest >> testContarDislikes [
	self assert: post contarDislikes equals: 2.
	self deny: post contarDislikes equals: 1.
]

{ #category : #tests }
PostTest >> testContarLikes [
	self assert: post contarLikes equals: 3.
]

{ #category : #tests }
PostTest >> testDiferenciaDeReacciones [
	self assert: post diferenciaDeReacciones equals: 1.
]
