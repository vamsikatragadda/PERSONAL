trigger Contact on Contact (before insert, before update) {
	
	List<Contact> dispLst =[select Name from Contact ];
	if (dispLst!=null && dispLst.size()> 0)
	{
	for (contact a:dispLst)
	system.debug(a.Name);
	}
}