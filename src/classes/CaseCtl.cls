global class CaseCtl implements Messaging.InboundEmailHandler {

global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,
                                                  Messaging.InboundEnvelope env){


Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();

String myPlainText = '';
String Description='';
String Product='';
String stopper='Stopper';
//This comment should go to GitHub
try
{
      myPlainText = email.plainTextBody;
      System.debug('plain test' + myPlainText );
      Description= myPlainText.substringBetween('Description :','Product :');
      System.debug('Description' + Description);
      Product = myPlainText.substringBetween('Product :','.');
      System.debug('Name of the product' + Product);

}
catch (System.StringException e)
{
     myPlainText = email.plainTextBody;
     System.debug('No <stop> in email: ' + e);
}



Case[] newCase = new Case[0];


try {
       Contact vCon = [Select Id, Name, Email
       From Contact
       Where Email =:email.fromAddress
       Limit 1];
       System.debug('Name of the product' + Product);
       Product2 vprod = [select id, Name from Product2 where Name =: Product  limit 1];








 newCase.add(new Case(Description = Description,
     Priority = 'Normal',
     Status = 'Inbound Email',
     Subject = email.subject,
     ContactId= vCon.Id,
     Product1__c=vprod.id));

     insert newCase;


      if (email.binaryAttachments !=
                    null && email.binaryAttachments.size()> 0)
        {
        for (integer i = 0 ; i < email.binaryAttachments.size() ; i++)
        {
        Attachment a = new Attachment(ParentId = newCase[0].Id,
        Name = email.binaryAttachments[i].filename,
        Body = email.binaryAttachments[i].body);
        insert a;
          }
         }

System.debug('New Case Object: ' + newCase);
}


   catch (System.QueryException e) {
   System.debug('Query Issue: ' + e);
}



  result.success = true;

  return result;
}



}
