Class {
	#name : #CuooraSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-UI'
}

{ #category : #'as yet unclassified' }
CuooraSession >> logout [
	user:=nil.
]

{ #category : #accessing }
CuooraSession >> user [
	^ user
]

{ #category : #accessing }
CuooraSession >> user: anObject [
	user := anObject
]
