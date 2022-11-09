public with sharing class contactClass {
    @AuraEnabled(cacheable=true)
    public static List<Contact> contactRecords(integer num){
        return [select FirstName,LastName,Title,Id 
        from Contact 
        order by FirstName ASC limit :num ];
    }
   
}
