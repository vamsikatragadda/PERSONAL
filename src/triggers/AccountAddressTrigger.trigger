trigger AccountAddressTrigger on Account (before insert,before update) {

for (Account a:Trigger.new){
 if (Trigger.isInsert){
    if(a.BillingPostalCode!='' && a.Match_Billing_Address__c ==True){  
       a.ShippingPostalCode=a.BillingPostalCode;
       a.Site='Test';
      }
 }

}  

}