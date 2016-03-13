Public class CsvRead{

Public Static void readrecord(List<lead> leadLst,String Name)
{

String DeletedUser =Name; 
Set<String> distinctRT = new Set<string>();
String finalList = 'Lead Name' + '\n';
List<lead> leadDelLst =new List<lead>();
leadDelLst =leadLst;

for (lead l:leadDelLst){
    distinctRT.add(l.Name); 
}

for (String s: distinctRT){
    string line = s + '\n'; 
    finalList += line; 
    
   
}
finalList +='\n'+'User Who has deleted these records'+'\n'+DeletedUser ;
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        blob csvBlob = Blob.valueOf(finalList);
        string csvname= 'Leadnamedistinct.xls';
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{'vamsikatragadda@gmail.com'};
        String subject ='Lead CSV';
        email.setSubject(subject);
        email.setToAddresses( toAddresses );
        email.setPlainTextBody('Lead CSV');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
}

}