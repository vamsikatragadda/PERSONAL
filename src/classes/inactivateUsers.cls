global class inactivateUsers implements Schedulable   {
	
	global void execute (SchedulableContext sc)
		{
		List<User> useridLst=new List<User>{};
		List<User> finalLst=new List<User>{};
		useridLst=[SELECT Id,IsActive FROM User where LastLoginDate < LAST_90_DAYS and IsActive=True ];
		
		//Iterating and check to deactivate the users
		
		if (useridLst!=null && useridLst.size()>0 )
		{
		for ( User usr:useridLst )
		{
		    usr.IsActive=False;
		    finalLst.add(usr);
		}
		
	Update finalLst;
		}

}
}