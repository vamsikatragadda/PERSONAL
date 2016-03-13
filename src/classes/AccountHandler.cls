public class AccountHandler {
    public static Account insertNewAccount( string Name){
    
     Account Accnt= new Account();
     Accnt.Name=Name;   
      try {
     insert Accnt;  
    } catch (Exception e){
     system.debug('Error'+e);
     return null;
    }
    return Accnt;
}}