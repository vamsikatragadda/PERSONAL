trigger New_Old_Values on Account (After update) {
    List<SLA_Tracking__c> SLAlist= new List<SLA_Tracking__c >();
            for(Account a:Trigger.new){
            
                if(trigger.oldmap.get(a.id).SLASerialNumber__c!=a.SLASerialNumber__c){
                    SLA_Tracking__c slaObj = new SLA_Tracking__c(SLA_Old__c=trigger.oldmap.get(a.id).SLASerialNumber__c,SLA_New__c=a.SLASerialNumber__c,Account__c=a.id);
                    SLAlist.add(slaObj);
                }}
Insert SLAlist;
}