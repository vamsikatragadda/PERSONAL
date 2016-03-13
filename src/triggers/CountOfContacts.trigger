trigger CountOfContacts on Contact (After insert,After update,After delete) {
    
Set<id> SetAccids = new Set<id>{};
     if(trigger.isInsert || trigger.isUpdate)   
        for(Contact c:Trigger.new)
        {
        if(trigger.isInsert)
            SetAccids.add(c.AccountId);
            
          if(trigger.isUpdate)  
          {
                 if(trigger.oldmap.get(c.id).Accountid!=c.accountId)
                 {
                     SetAccids.add(c.accountId);
                     SetAccids.add(trigger.oldmap.get(c.id).Accountid);
                 }
          }
        }
        
        
        if(trigger.isDelete)
        for(Contact c:Trigger.old)
        {
            SetAccids.add(c.accountId);
        }
        
        
    List<Account> counLst = new List<account>();
    List<account> finalLst = new List<account>();
    counLst=[select id,Count_of_contacts__c,(select id from account.contacts) from Account where id in:SetAccids];
    
    if(counLst!=null && counLst.size()>0)
    {
        for(Account a:counLst)
        {
            
            if(a.contacts!=null)
            {
            
            list<Contact> listCon =a.contacts;
            a.Count_of_contacts__c=listCon.size();
            
            }
            
            else
            a.Count_of_contacts__c=0;
            
            finalLst.add(a);
         }   
    }
    
    if(finalLst!=null &&finalLst.size()>0)
    
        update finalLst;
}