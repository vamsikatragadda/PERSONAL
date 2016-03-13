public class ContactSearch {
    public static List<Contact> searchForContacts(String LstName,string PstCode){
    List<Contact> CntctLst = new List<Contact>();
    if (LstName!=''&&PstCode!=null){
     CntctLst=[select id,name from contact where  LastName= :LstName and MailingPostalCode= :PstCode];}
    return CntctLst;
    }
}