@RestResource(urlMapping='/FieldCase')

global with sharing class RESTCaseController {

@Httpget
global static List<Case> getNewCase() {
 Id Id = RestContext.request.params.get('Id');
 if (Id!=null||Id!='')
     System.debug('Name: '+Id);
     else IfNull();
     List<case> cs=[select Id,status from case where id =:Id];
          return cs;
         }
         
         global static String IfNull(){
         return 'You Havent Passed Any Input for the API';
         }
@Httpdelete
global static String DeleteNewCase() {
 Id Id = RestContext.request.params.get('Id');
     System.debug('Name: '+Id);
     List<case> cs=[select Id,status from case where id =:Id];
     delete cs;
          return 'Case is Deleted';
         }

}