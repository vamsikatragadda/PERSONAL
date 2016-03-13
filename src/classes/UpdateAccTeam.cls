Public class UpdateAccTeam {
@future
Public static Void UpdateaccMethod(Set<id> setUsr)
{

List<Account_Team__c> accTeamLst = new List<Account_Team__c>();
List<Account_Team__c> accTeamLstFinal = new List<Account_Team__c>();
accTeamLst =[select id, IsInactive__c,Team_Member__c from Account_Team__c where Team_Member__c in:setUsr];

if(accTeamLst!=null && accTeamLst.size()>0)
{

    for(Account_Team__c accTem:accTeamLst)
    {
        accTem.IsInactive__c=True;
        accTeamLstFinal.add(accTem);
    }

Update accTeamLstFinal;

}

}
}