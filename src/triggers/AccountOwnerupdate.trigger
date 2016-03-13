trigger AccountOwnerupdate on Account (before insert, before update) {
    
    Set<Id> Owid=new Set<Id>{};
    
    for (Account a:Trigger.new)
    {
        Owid.add(a.OwnerId);
    }
    Map<Id,User> OwnrName=new Map<Id,User>([select Name from User where Id in :Owid]);
    
    
    
    for (Account a: Trigger.new){
    User usr=OwnrName.get(a.OwnerId);
        a.SalesRep__c=usr.Name;   }     
            }