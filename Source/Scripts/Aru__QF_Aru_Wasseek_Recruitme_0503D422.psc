;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname Aru__QF_Aru_Wasseek_Recruitme_0503D422 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Xaxheel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Xaxheel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wasseek
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wasseek Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

RefugeesRest.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Game.GetPlayer().RemoveItem(XaxheelRing, 1)
Alias_Wasseek.GetReference().AddItem(WasseekRing, 1)
Game.GetPlayer().AddItem(Gold, 25)
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RefugeesRest  Auto  

MiscObject Property Gold  Auto  

Armor Property XaxheelRing  Auto

Armor Property WasseekRing  Auto 


