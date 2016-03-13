public class UsrLst {

   

    public string userinput{get; set;}
    
    public User UsrLst2{get; set;}
  
    public User mngrlst{get;set;}
    public UserRole Rolematch{get;set;}
    public string matched{get;set;}
     
    
   public void getUserDetails()
     { 
        if (userinput!=''){
      UsrLst2 =[select Id,Name,title,UserRole.name,Manager.Id,manager.userrole.id,Manager.Name,manager.UserRole.name from User where id=:userinput];
      if (UsrLst2!=null){
      mngrlst=[select Name,UserRole.name,Manager.Id,Manager.Name,manager.UserRole.name from User where id=:UsrLst2.Manager.id];
        
        Rolematch=[select ParentRoleId from UserRole where id=:UsrLst2.Manager.userrole.Id and ParentRoleId!=''];
        if(Rolematch!=null){
        if(Rolematch.ParentRoleId==mngrlst.manager.UserRole.Id)
          { matched='True';
          }
        else {matched='False';
         }}}}
  }
}