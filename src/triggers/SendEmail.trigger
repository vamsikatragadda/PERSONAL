trigger SendEmail on Case (after insert, after update, after delete) {
    
    if(Trigger.isInsert||Trigger.isUpdate)
    {
    
    for (case c:Trigger.new)
    {
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
    String[] toAddresses = new String[] {'vamsikatragadda@gmail.com'};
    mail.setToAddresses(toAddresses);
    mail.setSubject('The case : c.CaseNumber');
    string body=('Hi Vamsi The case' +c.CaseNumber +'is created/Updated');
    mail.setHTMLBody(body);
    Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail});   
    }
    }
    
    if (Trigger.isDelete)
    {
        for (case c:Trigger.old)
                {
            System.debug('hi');
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
            String[] toAddresses = new String[] {'vamsikatragadda@gmail.com'};
            mail.setToAddresses(toAddresses);
            mail.setSubject('The case'+ c.caseNumber );
            string body=('Hi Vamsi The case' + c.caseNumber +'is Deleted');
            mail.setHTMLBody(body);
            Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail});
            }
            
     }
     
       
}