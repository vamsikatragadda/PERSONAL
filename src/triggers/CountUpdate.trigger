trigger CountUpdate on Account (After Update) {

       for(account a:Trigger.new)
       {
          if(a.Count_of_contacts__c ==1)
          {
              String s=a.name;
              Integer i=Integer.ValueOf(s.substring(14,15));
              Integer j=i+1;
              Account ac= new account(Name='genericaccount'+j);
              insert ac;
          }
       }
}