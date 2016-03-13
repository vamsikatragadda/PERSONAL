public class ContactChk {

  public static void ContactDup(List<Contact> ContctLst)
{
list<Contact> CntctLst = new List<Contact>();
set<string> Emailset = new set<string>();
CntctLst=[select Email from contact];
if (CntctLst!= null && CntctLst.size() > 0)
 for (contact c: CntctLst )
 Emailset.add(c.Email);
   if (Emailset!=null && Emailset.size() >0)
 for (contact c:ContctLst)
  {
  if (Emailset.contains(c.Email) ) 
  c.Email.adderror('This Email and Name already exists');
   }
}
}