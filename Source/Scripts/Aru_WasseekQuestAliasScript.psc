Scriptname Aru_WasseekQuestAliasScript extends ReferenceAlias 

 

Faction Property CurrentHireling Auto ; What type of object its effecting, (target) (default setting)

Message Property FollowerDismissMessage  Auto ; What type of object its effecting, (target) (default setting)

Actor Property PlayerREF Auto ; What type of object its effecting, (target) (default setting)

 

Event OnCombatStateChanged(Actor akTarget, int aeCombatState) ; on the event, combat state changes, and the player (aktarget), is in combat state

     If (akTarget == PlayerREF) ; aktarget = player

          (GetOwningQuest() as Aru_WasseekeiController).DismissFollower(0, 0) ; will dismiss follower if player attacked follower

     EndIf

EndEvent

 

Event OnDeath(Actor akKiller) ; when the follower dies 

     Self.GetActorRef().RemoveFromFaction(CurrentHireling) ;Removes follower from set faction

     Self.Clear() ;Clears script from actor (unsure of function)                                       

EndEvent   
