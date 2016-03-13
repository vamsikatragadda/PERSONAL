Public Class AccountCheck{

Public Static Void AccountDuplicate(List<Account> acList)
{

      List<account> accLst = new List<account>();
      set<String> uniqNmes = new set<String>();
      accLst=[select Name from Account];
      if(accLst!=null && accLst.size()>0)
          for(Account a:accLst)
          uniqNmes.add(a.Name);
  
              if(uniqNmes!=null && uniqNmes.size()>0) 
                  for(account a:acList)
                  {
                    if(uniqNmes.contains(a.Name))
                    a.Name.adderror('this account already exists in the system');
                  }
        
}

}