trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {

List<Task> Tsks = new List<Task>();


for (Opportunity Opp:Trigger.new){

 if(Trigger.isInsert){
    if(Opp.StageName=='Closed Won'){
    Task tsk = new Task(whatID = Opp.ID, Ownerid = Opp.OwnerId, Subject ='Follow Up Test Task');
    Tsks.add(tsk);}
    }
    
  if (Trigger.isUpdate){
  if(Opp.StageName=='Closed Won' && Opp.StageName!=Trigger.OldMap.get(Opp.Id).StageName){
  Task tsk = new Task(whatID = Opp.ID, Ownerid = Opp.OwnerId, Subject ='Follow Up Test Task');
  Tsks.add(tsk);}
  }
    }
     
     if (Tsks!=null&& Tsks.size() >0){
        Insert Tsks;
        }
}