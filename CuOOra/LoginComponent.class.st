"
|Cuoora|
Cuoora:= WAAdmin register: LoguinComponent asApplicationAt: 'login'.
Cuoora sessionClass: CuooraSession.
"
Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'usuario',
		'contrasena'
	],
	#category : #'CuOOra-UI'
}

{ #category : #initialization }
LoginComponent >> initialize [
	super initialize.
	usuario := Usuario new.
	
	
]

{ #category : #'private protocol' }
LoginComponent >> login [
	(self model userWithNombre: usuario  protectedBy: contrasena )
		ifNotNil: [ :it | self proceedWith: it ].
	usuario  := nil.
	contrasena  := nil
]

{ #category : #accessing }
LoginComponent >> model [
	^ Sistema soleInstance
]

{ #category : #rendering }
LoginComponent >> newPassword [
	^ contrasena 
]

{ #category : #rendering }
LoginComponent >> newPassword: aString [
	contrasena  := aString
]

{ #category : #rendering }
LoginComponent >> newUsuario [
	^ usuario
]

{ #category : #rendering }
LoginComponent >> newUsuario: aString [
	usuario := aString
]

{ #category : #private }
LoginComponent >> proceedWith: aUser [
	self session user: aUser.
	self call: HomeCuooraComponent new
]

{ #category : #rendering }
LoginComponent >> renderButtonsOn: aCanvas [
	self renderSignInButtonOn: aCanvas.
	aCanvas horizontalRule.
]

{ #category : #rendering }
LoginComponent >> renderContentOn: aCanvas [
	aCanvas form: [ 
	self renderInputElementsOn: aCanvas.
		
	self renderButtonsOn: aCanvas].
		
	
]

{ #category : #rendering }
LoginComponent >> renderInputElementsOn: aCanvas [

   aCanvas label: 'Usuario'.
	aCanvas paragraph: [ (aCanvas textInput on: #newUsuario  of: self) value: ''].
	aCanvas label: 'Contrasena'.
	aCanvas paragraph: [ aCanvas passwordInput on: #newPassword of: self ]


]

{ #category : #rendering }
LoginComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self login ];
		with: 'Iniciar Sesion'
]
