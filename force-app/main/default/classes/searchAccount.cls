public with sharing class searchAccount {
    @AuraEnabled(cacheable=true)
    public static List<Account> RetrievedAccounts(string text){
        
        string input='%'+text+'%';
        
        list<Account> ace= [select Id, Name, Website, Industry from Account where Name like :input];
        system.debug(ace);
        return ace;
    }
    
} 
