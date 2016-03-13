trigger CaseTrigger on Case (before insert) {
list<case> CaseLst = new List<case>();
set <string> caseStg = new set<string>();
CaseLst=[select Subject from case];
if (  CaseLst!=null && CaseLst.size()>0 )
   for ( case c:CaseLst)
   caseStg.add(c.Subject);
if (caseStg!=null && caseStg.size() > 0 )
   for (case fc:trigger.new)
   {
   if (caseStg.contains(fc.Subject))
   fc.Contact.AddError('This contact already exists');
   }
    

}