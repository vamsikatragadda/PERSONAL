public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(string Name ) {
    List<List<sObject>> searchList = [FIND :Name IN ALL FIELDS RETURNING Contact(FirstName,LastName) ,Lead(FirstName,Lastname)];
    return searchList;
    }

}