public with sharing class ActionSupFunController1 {
public string Display_This_String{get;set;}

public ActionSupFunController1(){
Display_This_String='This is Controller Message';
}
public void actionFunMethod(){
Display_This_String='This is for ActionFunction';
}
public void actionSupMethod(){
Display_This_String='This is for ActionSupport';
}
}