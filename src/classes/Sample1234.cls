Public Class Sample1234{

    public List<account>oppList {get;set;}

    public Sample1234() {
        oppList = new List<Account>();
        oppList=[select name,(select name from contacts) from Account limit 5];
    }


    public Sample1234(ApexPages.StandardController controller) {

    }

    
    Public pagereference submit()
    {
        pagereference p = new pagereference('https://www.gmail.com');
        
        return p;
    }
}