Scriptname Aru_WasseekeiController extends Quest

 

Actor Property PlayerREF Auto ; reference to player in script

ReferenceAlias Property FollowerAlias Auto ;Links to quest alias must be set manually

Faction Property DismissedFollowerFaction Auto ;Sets default value to DismissedFollowerFaction into properites tab in creation kit when auto filling 

Faction Property CurrentHireling Auto ;Sets default value to CurrentHireling into properites tab in creation kit when auto filling 

Message Property  FollowerDismissMessage Auto ;Sets default value to FollowerDismissMessage into properites tab in creation kit when auto filling

Message Property  FollowerDismissMessageWedding Auto ;Sets default value to FollowerDismissMessageWedding into properites tab in creation kit when auto filling

Message Property  FollowerDismissMessageCompanions Auto ;Sets default value to FollowerDismissMessageCompanions into properites tab in creation kit when auto filling

Message Property  FollowerDismissMessageCompanionsMale Auto ;Sets default value to FollowerDismissMessageCompanionsMale into properites tab in creation kit when auto filling

Message Property  FollowerDismissMessageCompanionsFemale Auto ;Sets default value to FollowerDismissMessageCompanionsFemale into properites tab in creation kit when auto filling

Message Property  FollowerDismissMessageWait Auto ;Sets default value to FollowerDismissMessageCompanionsFemale into properites tab in creation kit when auto filling

SetHirelingRehire Property HirelingRehireScript Auto ;Sets default value to HirelingRehireScript into properites tab in creation kit when auto filling

GlobalVariable Property FollowerRecruited Auto ;Sets default value to FollowerRecruited into properites tab in creation kit when auto filling

Int Property iFollowerDismiss Auto Conditional

 

Function SetFollower(ObjectReference FollowerRef)

     actor FollowerActor = FollowerRef as Actor ;Set to youyr follower

     FollowerActor.RemoveFromFaction(DismissedFollowerFaction) ;When you take follower with you removes from dismissed follower faction

     If FollowerActor.GetRelationshipRank(PlayerREF) <3 && FollowerActor.GetRelationshipRank(PlayerREF) >= 0

          FollowerActor.SetRelationshipRank(PlayerREF, 3)

     EndIf

     FollowerActor.SetPlayerTeammate() ;Sets to tplayer teammate

     FollowerAlias.ForceRefTo(FollowerActor)

     FollowerActor.EvaluatePackage() ;Evaluates packages 

     FollowerRecruited.SetValue(1) ;Sets global variable to track if following player to 1

EndFunction

 

Function FollowerWait() ;Makes follower wait

     actor FollowerActor = FollowerAlias.GetActorRef() as Actor

     FollowerActor.SetActorValue("WaitingForPlayer", 1) ;Sets actor value to waiting for player for dialogue prompts 

     SetObjectiveDisplayed(10, abforce = true)

EndFunction

 

Function FollowerFollow()

     actor FollowerActor = FollowerAlias.GetActorRef() as Actor

     FollowerActor.SetActorValue("WaitingForPlayer", 0)

     SetObjectiveDisplayed(10, abdisplayed = false) ; Enables map marker

     FollowerActor.EvaluatePackage()

EndFunction

 

Function DismissFollower(Int iMessage = 0, Int iSayLine = 1)

     If FollowerAlias && FollowerAlias.GetActorReference().IsDead() == False

          If iMessage == 0

               FollowerDismissMessage.Show()

          ElseIf iMessage == 1

               FollowerDismissMessageWedding.Show()

          ElseIf iMessage == 2

               FollowerDismissMessageCompanions.Show()

          ElseIf iMessage == 3

               FollowerDismissMessageCompanionsMale.Show()

          ElseIf iMessage == 4

               FollowerDismissMessageCompanionsFemale.Show()

          ElseIf iMessage == 5

               FollowerDismissMessageWait.Show()

          Else

              FollowerDismissMessage.Show()

          EndIf

          actor DismissedFollowerActor = FollowerAlias.GetActorRef() as Actor

          DismissedFollowerActor.StopCombatAlarm()

          DismissedFollowerActor.AddToFaction(DismissedFollowerFaction)

          DismissedFollowerActor.SetPlayerTeammate(false)

          DismissedFollowerActor.RemoveFromFaction(CurrentHireling)

          DismissedFollowerActor.SetActorValue("WaitingForPlayer", 0)

          FollowerRecruited.SetValue(0)

          HirelingRehireScript.DismissHireling(DismissedFollowerActor.GetActorBase())

          If iSayLine == 1

               iFollowerDismiss = 1

              DismissedFollowerActor.EvaluatePackage()

             Utility.Wait(2)

          EndIf

             FollowerAlias.Clear()

             iFollowerDismiss = 0

     EndIf

EndFunction