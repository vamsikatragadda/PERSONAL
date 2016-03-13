trigger CreatecontactwhenAccount on Account (After insert, After update) {
    //Creating 2 Maps to get the OwnerId and ProfileId
    //Passing OwnerId into Map to retrive Profile Id
    //Passing ProfileId into Map to get Profile Name to create contact with that name
    //Map Definitions
    
    Map<id,id> OwnrMap = new Map<Id,Id>{};
    Map<Id,String> PrfNmeMap = new Map<Id,String>{};
    Map<Id,String> EmailMap = new Map<Id,String>{};
    
    List<User> OwnrUsrIdLst = new List<User>{};
    List<Profile> PrfIdLst = new List<Profile>{};
    List<User> EmailLst = new List<User>{};
    
    OwnrUsrIdLst=[select Id,ProfileId from User];
    PrfIdLst=[select Id,name from Profile where Name!='Standard Platform User' ];
    EmailLst=[select Id,Email from User];
    
    
    //Iterating the Lists to put the values into OwnrMap
        
    if (OwnrUsrIdLst!=null && OwnrUsrIdLst.size() >0)
    {
    for (User usr:OwnrUsrIdLst)
    {
        OwnrMap.put(usr.id,usr.ProfileId);
    }
    }
    
    //Iterating to copy the Profileids and Profile Names to PrfNmeMap
    if (PrfIdLst!=null && PrfIdLst.size()>0)
    {
    for (profile Prf:PrfIdLst)
    {
        PrfNmeMap.put(Prf.id,Prf.name);
    }   
    }
    //Iterating to copy the User/OwnerIds and Email to the Map
    if(EmailLst!=null && EmailLst.size()>0)
    {
        for (user Emailusr:EmailLst)
        {
            EmailMap.put(Emailusr.Id,Emailusr.Email);
        }
    }
    
    //Passing the trigger.new Values to Map
    List<Contact> FinalinstList = new List<Contact>{};
        if (Trigger.isInsert || Trigger.isUpdate) {
        
        for (Account ActFin:trigger.new)
        {
            if(Trigger.isInsert) {
    Contact c= new Contact (FirstName=PrfNmeMap.get(OwnrMap.get(ActFin.OwnerId)),LastName='Katragadda',
    AccountId = ActFin.id,Email=EmailMap.get(ActFin.OwnerId));
    FinalinstList.add(c);
    }
    if (FinalinstList!=null && FinalinstList.size()>0)
    {
        Insert FinalinstList;
    } 
        }
        
    
        }}