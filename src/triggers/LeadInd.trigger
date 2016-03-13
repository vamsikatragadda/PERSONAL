trigger LeadInd on Lead (before insert, before update) {
    
    List<Ship_Detail__c> shLst=new List<Ship_Detail__c>();
    Set<Id> Lids=new set<Id>();
    
    for (Lead le:trigger.new){
        Lids.add(le.Ownerid);}
        
    
    Map<Id,User> Mpus=new Map<Id,User>([select Name from User where Id in :Lids]);
    
    for(Lead l:Trigger.new)
    {
        l.Industrynew__c=l.Industry;
        l.Industryold__c=Trigger.OldMap.get(l.id).Industry;
    }
    
    
    

}