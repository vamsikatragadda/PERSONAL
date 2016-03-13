trigger CalBonus on Account (before insert, before update) {

for (Account a:Trigger.new )
   {
   a.Bonus__c=a.Salary__c*0.10;
   a.SLAExpirationDate__c=date.today()+90;
   if (a.Salary__c >=100000)
        a.Highly_Paid_Resource__c=True;
             
     }
}