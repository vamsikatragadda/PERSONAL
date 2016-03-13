trigger Casecount on Case (after delete, after insert, after update) {
 List<Case> OwnrIdLst=new List<Case>();
 List<Case> counLst=new List<Case>();
 Map<Id,List<case>> casecntMap =new Map<Id,List<case>>();
 List<Skillset__c> sklLst = new List<Skillset__c>();
 List<Skillset__c> FinalsklLst = new List<Skillset__c>();
 sklLst=[select id,SkillUserId__c,cases__c from Skillset__c];
 
         if(Trigger.Isinsert){
         	         	{
           OwnrIdLst=[select id,OwnerId from case where Id in :Trigger.newMap.keyset()];
           if(OwnrIdLst!=null && OwnrIdLst.size()>0){ 
                        for(case OL:OwnrIdLst){
                        List<Case> TempList=casecntMap.get(OL.OwnerId);
                                if(TempList==null)
                                    {
                                        TempList=new List<Case>();
                                        casecntMap.put(OL.OwnerId,TempList);
                                     }
                    TempList.add(OL); 
                    
                     
                                }  
                                
                                system.debug('++++++'+casecntMap+'======');
            
                }  }
                
                if(sklLst!=null && sklLst.size()>0)
                for(Skillset__c recSk:sklLst)
                {
                    
                   List<Case> casLst= casecntMap.get(recSk.SkillUserId__c);
                   system.debug('@@@@@'+recSk.SkillUserId__c+casecntMap+casecntMap.get(recSk.SkillUserId__c));
                   system.debug('++++++'+casLst+'======');
                   if(casLst!=null && casLst.size()>0)
                   recSk.cases__c =recSk.cases__c+casLst.size();
                  
                   FinalsklLst.add(recSk);
                    
                }
            if(FinalsklLst!=null && FinalsklLst.size()>0)    
           Update FinalsklLst;}
           
           //To reduce the count while closing the case;
           if(Trigger.isUpdate){
           	{
           OwnrIdLst=[select id,OwnerId from case where Id in :Trigger.oldMap.keyset() and IsClosed=true];
           system.debug('--------------'+OwnrIdLst);
           if(OwnrIdLst!=null && OwnrIdLst.size()>0){ 
                        for(case OL:OwnrIdLst){
                        List<Case> TempList=casecntMap.get(OL.OwnerId);
                                if(TempList==null)
                                    {
                                        TempList=new List<Case>();
                                        casecntMap.put(OL.OwnerId,TempList);
                                     }
                    TempList.add(OL); 
                    
                     
                                }  
                                
                                system.debug('++++++'+casecntMap+'======');
            
                }  }
                if(sklLst!=null && sklLst.size()>0)
                for(Skillset__c recSk:sklLst)
                {
                    
                   List<Case> casLst= casecntMap.get(recSk.SkillUserId__c);
                   
                   system.debug('++++++'+casLst+'======');
                   system.debug('***********'+recSk.cases__c);
                   //system.debug('&&&&&&&&&'+casLst.size());
                   if(casLst!=null && casLst.size()>0)
                   recSk.cases__c =recSk.cases__c-casLst.size();
                    FinalsklLst.add(recSk);
                    system.debug('======'+FinalsklLst);
                }
            if(FinalsklLst!=null && FinalsklLst.size()>0)    
           Update FinalsklLst;
           }
}