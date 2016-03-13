trigger Usage_Customsetting on Account (Before insert,before update) {

    for(Account a:Trigger.new)
    {
            if(a.CustomerPriority__c==Account__c.getvalues(a.type).risk__c)
                a.Active__c='Yes';
            else
                a.Active__c='No';
       
    }

}