trigger AccOpp on Account (after insert, after update) {
    
    List<Opportunity> AccLst=new List<Opportunity>();
    List<Opportunity> UpdLst=new List<Opportunity>();
    List<Opportunity> FUpdLst=new List<Opportunity>();
    Map<Id,List<Opportunity>> OppMap=new Map<Id,List<Opportunity>>();
    
    If(trigger.Isupdate)
    {
        AccLst=[select Id,AccountId from Opportunity where AccountId in :trigger.newmap.keyset()];
        if(AccLst!=null && AccLst.size()>0)
            for (Opportunity Op:AccLst)
            {
                List<Opportunity> OpLst=OppMap.get(Op.AccountId);
                if(OpLst==null)
                {
                     OpLst=new List<Opportunity>(); 
                    OppMap.put(op.AccountId,OpLst);
                        }
                    OpLst.add(Op);
            }
                for(Account a:Trigger.new)
                {
                    //if(a.Type=='Customer - Direct')
                    UpdLst=OppMap.get(a.Id);
                    system.debug(UpdLst);
                        if (UpdLst!=null && UpdLst.size()>0)
                        {
                            for (Opportunity opt:UpdLst)
                            {
                                if(a.Type=='Customer - Direct')
                                    opt.Type='Existing Customer - Upgrade';
                                if(a.Type=='Installation Partner')
                                    opt.DeliveryInstallationStatus__c='Completed';
                            FUpdLst.add(opt);
                            system.debug(FUpdLst);
                            }
                            
                            }                       
                }
    }
            update FUpdLst;
                        
    if(Trigger.isInsert)
    { 
        for(Account Act:Trigger.new)
        {
            Opportunity Opt=new Opportunity();
            opt.AccountId=Act.Id;
            opt.DeliveryInstallationStatus__c='In progress';
            opt.Name=Act.Name;
            opt.StageName='Qualification';
            opt.CloseDate=date.today();
            FUpdLst.add(Opt);
            
        }
        if (FUpdLst!=null && FUpdLst.size()>0)
         insert FUpdLst;
    }
}