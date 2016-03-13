trigger Dupcontacts on Contact (before insert) {
list<contact> listcontacts = new List<contact>();
string dataEmail;
string dataName;
string dataPhone;
for (contact c: Trigger.new)
{
  dataEmail=c.Email;
  dataName=c.Name;
  dataPhone=c.HomePhone;
}
listcontacts =[ select id,Email from Contact where Email=:dataEmail and 
Name=:dataName and HomePhone=:dataPhone];
if ( listcontacts!=null &&  listcontacts.size() >0)
  Trigger.new[0].Email.adderror('this Email already exists in the system');
}