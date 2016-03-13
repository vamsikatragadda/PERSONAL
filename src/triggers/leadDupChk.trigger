trigger leadDupChk on Lead (before insert, before update) {
List<Lead> leadLst =new List<Lead>{};
List<string> finalLeadLst =new List<string>{};
set <string> uniqSet=new set<string>{};
//Getting the data into list from the database
leadLst=[select Email,SICCode__c FROM Lead];
//Iterating the list into Set for Uniq Values into Set
if (leadLst!=null && leadLst.size() >0)
{
for (Lead L : leadLst)
 {
 uniqSet.add( L.Email + L.SICCode__c);
 system.debug(L.Email + L.SICCode__c);
     }
   }
//Iterating the set with the values from trigger.new
if (uniqSet!=null && uniqSet.size()>0)
{
for (Lead K : trigger.new)
  { 
    if (uniqSet.contains(K.Email + K.SICCode__c))
    {
    k.Email.addError('There is an Email and SIC code already Exisits');
    k.SICCode__c.addError('There is an SIC Code already Exists');
     } 
      }
   }
}