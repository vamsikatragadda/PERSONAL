trigger CsvStore on Lead (Before delete) {
User u = [select Name from user where id=:userinfo.getuserid()];
string username = u.name;
List<lead> leadLst = new List<Lead>();
leadLst =[select id,Name from lead where id in:trigger.oldmap.keyset()];

CsvRead.readrecord(leadLst,username);

}