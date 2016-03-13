trigger AccountProfile on Account (Before insert,Before update) {

    Map<id,String> Profmap = new Map<id,String>();
    Map<id,id> usermap= new Map<id,id>();
    List<Profile> prfLst= new List<Profile>();
    List<user> usrLst= new List<user>();
        prfLst=[select id,name from profile];
        usrLst=[select id,ProfileId from User];
        if(prfLst!=null && prfLst.size()>0)
            for(Profile p:prfLst)
            {
            Profmap.put(p.id,p.name);
            }
            if(usrLst!=null && usrLst.size()>0)
            for(User u:usrLst)
            {
                usermap.put(u.id,u.profileId);
            }
    

            for(Account a:Trigger.new)
            {
                a.SLASerialNumber__c=Profmap.get(usermap.get(a.ownerId));
                
               
            }
                

}