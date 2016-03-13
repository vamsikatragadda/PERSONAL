trigger UserInavtiveAccTeam on User (After Update) {
set<id> usrSet = new set<id>();
for(User u:Trigger.new)
{
    if(u.IsActive!=Trigger.oldmap.get(u.id).IsActive && u.IsActive==false)
    {
         usrSet.add(u.id);  
    }
}

UpdateAccTeam.UpdateaccMethod(usrSet);




}