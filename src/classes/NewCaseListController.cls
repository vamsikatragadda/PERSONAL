public class NewCaseListController{
     
    public List<Case> getNewCases(){
     List<case> CsLst = new List<case>();
     CsLst=[select id,CaseNumber from case where Status='New'];
     return CsLst;
    }

}