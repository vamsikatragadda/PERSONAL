global class batchNotify implements Database.batchable<Sobject>  {

global Database.querylocator start(Database.batchablecontext bc)
{
	string emQry='SELECT Email FROM Contact where  Expiry_date__c <=  NEXT_N_DAYS:10 and Email!=null';
	Database.querylocator queLoc=database.getQuerylocator(emQry);
	return queLoc;
	}
	
	global void Execute(Database.batchablecontext bc,List<Contact> Scope)
	{
		for(contact c:Scope)
		{
			Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
    		String[] toAddresses = new String[] {c.Email};
    		mail.setToAddresses(toAddresses);
    		mail.setSubject('The contact' +c.Email +'will be expired soon');
    		string body=('Hi'+c.Email +'The contact will be Expired');
    		mail.setHTMLBody(body);
    		Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail}); 
		}
		}
		
		global void Finish(Database.batchablecontext bc)
		{

			}
		
}