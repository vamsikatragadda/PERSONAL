trigger bannedcountries on Account (before insert, before update) {

for(Account a:Trigger.new)

    if(a.Country__c==Riskcountries__c.getvalues(a.Country__c).Country__c)
        a.Country__c.addError('You cannot create account using blacklist country');
            

}