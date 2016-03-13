trigger TestAfterBefore on Account (After insert) {
List<account> accLst = new List<account>();
    for(Account a:trigger.new)
    {
        Account accRec = new account(id=a.id,AccountSource='Web');
        
        update accRec;
        //accLst.add(accRec);
    }
//Update accLst;
}