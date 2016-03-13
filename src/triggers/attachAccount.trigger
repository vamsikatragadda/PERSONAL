trigger attachAccount on Contact (before insert) {
 
   Account AccntCnt=[select id from account where Name like 'genericaccount%' order by createddate desc limit 1 ];

                  for(contact c:Trigger.new)   
                    if (c.LeadSource=='Web')
                          c.AccountId=AccntCnt.Id;  
                          
 }