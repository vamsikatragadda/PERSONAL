trigger oldcaseStatus on Case (After update) {

List<Case> FinsrtLst = new List<Case>{};
for (Case cs:Trigger.new)
{
    if (Trigger.oldMap.get(cs.id).Status!=cs.Status && Trigger.oldMap.get(cs.id).Status!=null )
    {
        Case Csr= new case(Old_Case_Status__c=Trigger.oldMap.get(cs.Id).Status,Id=cs.Id);
    FinsrtLst.add(Csr);
    
    }
}
if (FinsrtLst!=null && FinsrtLst.size() > 0)
update FinsrtLst; 
}