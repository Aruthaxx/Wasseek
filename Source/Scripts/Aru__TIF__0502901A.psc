;define the function fragment, impliments the TopicInfo class
Scriptname Aru__TIF__0502901A Extends TopicInfo Hidden

;Function_0, entry point for talking code. gets passed a reference to the follower
Function Fragment_0(ObjectReference akSpeakerRef)
	;setup an Actor object, for later use. 
	Actor akSpeaker = akSpeakerRef as Actor	
	;call the function dismissFollower from the Aru_WasseekeiController. this doesn't use akSpeaker.
	(akSpeaker.GetOwningQuest() as Aru_WasseekeiController).DismissFollower(0,0)	
EndFunction