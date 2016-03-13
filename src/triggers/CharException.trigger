trigger CharException on Account (After insert,After update) {

List<Account> ALst = new List<Account>{};
if (Trigger.isInsert||Trigger.isUpdate)
{
    for (Account a : Trigger.new)
    {
        
        Account AcctLst = new account(Id=a.id,TextLimit__c='vamsiKatragadda');
        ALst.add(AcctLst);
        
    if  (ALst!=null && ALst.size()>0)
    {
        Database.Update(ALst,False);
    }
    
     }}
}