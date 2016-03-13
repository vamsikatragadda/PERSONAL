global class schdleClsDlt implements Database.batchable<Sobject> {
	
	global Database.querylocator start(Database.batchablecontext bc)
	
	{
		datetime myDateTime = datetime.now().addHours(-1);
	string emQry='SELECT Id FROM case where  CreatedDate =:myDateTime and IsClosed=true' ;
	Database.querylocator queLoc=database.getQuerylocator(emQry);
	return queLoc;
		}
		
	global void Execute(Database.batchablecontext bc,List<Case> Scope)
	{
		List<Case> FLst=new List<Case>();
		for(Case c:Scope)
		{
			case csLst=new case(Id=c.Id);
			FLst.add(csLst);
		}
		delete FLst;
		}
		
		global void Finish(Database.batchablecontext bc)
		{

			}
}