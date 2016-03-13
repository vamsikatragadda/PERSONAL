global class ContactEmailupdate implements Database.batchable<Sobject>{

global Database.querylocator start(Database.batchablecontext bc)
{
    String query='select email from contact where email!=null';
    Database.querylocator queLoc=database.getQuerylocator(query);
    return queLoc;
}

global void Execute(Database.batchablecontext bc,List<Contact> Scope)
{
    for(Contact c:Scope)
    {
        c.Languages__c=c.email;
        
    }
    Database.Update(Scope,false);
}

global void Finish(Database.batchablecontext bc)
{

}

}