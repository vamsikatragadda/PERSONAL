trigger Accountclone on Account (before insert,before update) {

if(Userinfo.getUserid().substring(0,15)==label.logged_in_user)
{
if(FlagBoolean.bonusflag)
{

FlagBoolean.bonusflag=false;
for(Account a:Trigger.new)
{
    if(a.Type=='Customer - Direct')
        a.Rating='Hot';
        a.Bonus__c=a.Bonus__c+200;
}

}
}
}