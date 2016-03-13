trigger ActTeamCreate on Account (After insert, After update) {
      
    List<Account_Team__c> ActtList=new List<Account_Team__c>{};
    List<Account_Team__c> UpdtActt=new List<Account_Team__c>{};
    List<Account_Team__c> finalUpdtActt=new List<Account_Team__c>{};
    Map<Id,List<Account_Team__c>> MapIds=new Map<Id,List<Account_Team__c>>();
                   if(Trigger.Isupdate) {
                        ActtList=[select id,Account__c from Account_Team__c where account__c in:trigger.newmap.keyset()];
                        if(ActtList!=null && ActtList.size()>0)
                            for(Account_Team__c recACT:ActtList)
                            {
                                    List<Account_Team__c> templist=MapIds.get(recACT.Account__c );
                                if(templist==null)
                                {
                                    templist= new List<Account_Team__c>();
                                    MapIds.put(recACT.Account__c,templist);
                                
                                }
                                templist.add(recACT);
                            }
                            
                            
                            for(Account a:Trigger.new)
                            {
                                if(a.Ownerid!=trigger.oldmap.get(a.id).Ownerid)
                                {
                                UpdtActt=MapIds.get(a.id);
                                if(UpdtActt!=null && UpdtActt.size()>0)
                                for(Account_Team__c recAc:UpdtActt)
                                {
                                    recAc.Team_Member__c=a.Ownerid;
                                    finalUpdtActt.add(recAc);
                                }
                                }
                            }
                            
                            
                            update finalUpdtActt;
                    
                    }
    
            if (Trigger.isInsert){
                for (Account act:Trigger.new){
                    Account_Team__c actTeam = new Account_Team__c();
                    actTeam.Team_Member__c=act.OwnerId;
                    actTeam.Name=act.Name;
                    actTeam.Account__c=act.Id;
                    ActtList.add(actTeam);
                }    
                if(ActtList!=null && ActtList.size() > 0)
                   insert ActtList;
            }        
}