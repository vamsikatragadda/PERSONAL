trigger bigDealalert on Opportunity (after insert,after update,after delete) {
    
    List<Opportunity> opts=new List<Opportunity>{};
    
    if(Trigger.isInsert || Trigger.isUpdate)
    {
    for (Opportunity op:Trigger.new ){
    if (Trigger.isInsert||Trigger.isUpdate)
        { 
            if (Trigger.isInsert){
            Opportunity opt=new Opportunity(Id=op.Id,Name=op.Name,LeadSource='Other');
            opts.add(opt);
            update opts;}
            
        if (op.Probability >=50 && op.Type=='New Customer'){
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
    String[] toAddresses = new String[] {'vamsikatragadda@gmail.com'};
    mail.setToAddresses(toAddresses);
    mail.setSubject('The Oppurtunity' + op.Name);
    string body=('Hi Vamsi The case' +op.Name +'is created/Updated');
    mail.setHTMLBody(body);
    Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail});   
            }
        }}
    }
    if (Trigger.isDelete)
    {
    for(Opportunity op:Trigger.old){
        system.debug('hui');
        
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
    String[] toAddresses = new String[] {'vamsikatragadda@gmail.com'};
    mail.setToAddresses(toAddresses);
    mail.setSubject('The Oppurtunity' + op.Name);
    string body=('Hi Vamsi The Oppurtunity' +op.Name +'is Deleted');
    mail.setHTMLBody(body);
    Messaging.sendEmail(new Messaging.SingleEMailMessage[]{mail});}
    }
        
    }