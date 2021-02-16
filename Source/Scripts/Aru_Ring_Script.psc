Scriptname Aru_Ring_Script Extends ObjectReference 

Event OnContainerChanged(ObjectReference newContainer, ObjectReference oldContainer)
	if (newContainer == Game.GetPlayer())
        Aru_Wasseek_Recruitment_Quest.SetObjectivedisplayed(30)
		Aru_Wasseek_Recruitment_Quest.SetStage(30)
	endif
EndEvent
Quest Property Aru_Wasseek_Recruitment_Quest  Auto  
